require "google/cloud/translate/v2"
require "google/cloud/language/v2"
require "cgi"

class ArticleCreator
  ENGLISH_CATEGORY_NAMES = {
    "Adult" => "Others",
    "Arts & Entertainment" => "Entertainment",
    "Autos & Vehicles" => "Lifestyle",
    "Beauty & Fitness" => "Lifestyle",
    "Books & Literature" => "Lifestyle",
    "Business & Industrial" => "Business",
    "Computers & Electronics" => "Technology",
    "Finance" => "Business",
    "Food & Drink" => "Food",
    "Games" => "Lifestyle",
    "Health" => "Health",
    "Hobbies & Leisure" => "Lifestyle",
    "Home & Garden" => "Lifestyle",
    "Internet & Telecom" => "Technology",
    "Jobs & Education" => "News",
    "Law & Government" => "News",
    "Business" => "Business",
    "Politics" => "News",
    "Sports" => "Sports",
    "Weather" => "News",
    "Gossip" => "Entertainment",
    "Online Communities" => "Technology",
    "People & Society" => "News",
    "Pets & Animals" => "Lifestyle",
    "Real Estate" => "Business",
    "Reference" => "Others",
    "Science" => "Science",
    "Sensitive Subjects" => "News",
    "Shopping" => "Lifestyle",
    "Travel" => "Travel",
    "Other" => "Others"
  }

  MALAY_TRANSLATION_CATEGORIES = {
    "Others" => "Lain-lain",
    "Entertainment" => "Hiburan",
    "Lifestyle" => "Gayahidup",
    "Business" => "Niaga",
    "Technology" => "Teknologi",
    "Food" => "Makanan",
    "Health" => "Kesihatan",
    "News" => "Berita",
    "Sports" => "Sukan",
    "Science" => "Sains",
    "Travel" => "Perlancongan"
  }

  def initialize(publisher)
    @translate = Google::Cloud::Translate::V2.new(
      key: Rails.application.credentials.dig(:gcloud_translate, :api_key)
    )
    @publisher = publisher
  end
  def create
    feeds = XmlParser.new(@publisher.rss_url).parse
    feeds.each do |feed|
      next if Article.exists?(publisher_id: @publisher.id, guid: feed[:guid])

      article = Article.new
      code = detect_article_language(feed[:description])

      article.title = feed[:title]
      article.article_link = feed[:article_link]
      article.image_link = feed[:image_link]
      article.guid = feed[:guid]
      article.published_date = feed[:published_date]
      article.publisher = @publisher
      article.language = find_language(code)

      if @publisher.name == "EatDrinkKL"
        article.category = Category.find_by(name: "Food")
      else
        article.category = find_category(feed[:description], code)
      end

      article.save
    end
  end

  def find_language(code)
    if code == "en"
      Language.find_by(code: code)
    elsif code == "ms" || code == "id"
      Language.find_by(code: "ms")
    else
      @publisher.language
    end
  end

  def find_category(desc, code)
    category = categorise_article(desc, code)
    if Category.exists?(name: category)
      Category.find_by(name: category)
    else
      @publisher.default_category
    end
  end

  def detect_article_language(description)
    @translate.detect(description).language
  end

  def categorise_article(description, language)
    if description.nil? || description.empty?
      return ""
    end

   language_client = ::Google::Cloud::Language::V2::LanguageService::Client.new do |config|
      config.credentials = Rails.application.credentials.dig(:gcloud_language, :keyfile_path)
   end

   if language != "en"
     # translate to english first because Language client cannot take Malay
     content = @translate.translate(description, to: "en").text
   else
     content = description
   end

   request_document = Google::Cloud::Language::V2::Document.new(type: "PLAIN_TEXT", content: CGI.unescapeHTML(content))
   request = Google::Cloud::Language::V2::ClassifyTextRequest.new(document: request_document)

  begin
    response = language_client.classify_text(request)
  rescue Google::Cloud::InvalidArgumentError
    return ""
  end
   # only taking the category with the highest confidence
   highest_confidence = response.categories[0]

   if highest_confidence.nil?
     return ""
   end

   results = highest_confidence.name.split("/")
   main_result = results[1]

   # if the category is "News" find subcategory
   if main_result == "News"
     main_result = results[2].split(" ")[0]
   end

   category = ENGLISH_CATEGORY_NAMES[main_result]

   # if language is in Malay / Indonesian` translate the category to Malay
   if language != "en"
     if language == "ms" || language == "id"
       category = MALAY_TRANSLATION_CATEGORIES[category]
     else
       return ""
     end
   end

   if category.nil?
     return ""
   end

   category
  end
end

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

  def initialize
    @translate = Google::Cloud::Translate::V2.new(
      key: Rails.application.credentials.dig(:gcloud_translate, :api_key)
    )
  end

  def detect_article_language(description)
    @translate.detect(description).language
  end

  def categorise_article(description, language)
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

   response = language_client.classify_text(request)
   # only taking the category with the highest confidence
   results = response.categories[0].name.split("/")
   main_result = results[1]

   # if the category is "News" find subcategory
   if main_result == "News"
     main_result = results[2].split(" ")[0]
   end

   category = ENGLISH_CATEGORY_NAMES[main_result]

   # if language is in Malay / Indonesian` translate the category to Malay
   if language == "ms" || language == "id"
     category = MALAY_TRANSLATION_CATEGORIES[category]
   end

   category
  end
end

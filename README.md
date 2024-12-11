
# news-aggregator

A web application that aggregates news via RSS/Atom feeds of newspapers, news tv channel or blogs.

Deployment link: [https://news-aggregator-white-wildflower-9335.fly.dev/](https://news-aggregator-white-wildflower-9335.fly.dev/)

If it is too long use this one: [snippit.my/tF](https://snippit.my/tF) (shortened the link using my own [url-shortener](https://github.com/aliaizad72/url-shortener) project!). 

Note that it might take some time to load due to the warm-restart of fly.io machines, retry a few times if it fails.

## Main Feature
The website lists news articles that are recently published on their respective publishers. Each news listing consists of their title, publisher, category, thumbnail, and published time for the article. The publishers can be added given that they have a valid RSS/Atom feed. After the creation of a new publisher and their respective articles, the program will fetch for new updates from that publisher every hour.

## How the Features Are Implemented
**Database Schema**

![enter image description here](https://live.staticflickr.com/65535/54193552126_c92a5877aa_c_d.jpg)

**Overall Flow of Articles Creation**

![enter image description here](https://live.staticflickr.com/65535/54192698932_7b6b68422d_c_d.jpg)

**Fetching and Parsing XML from the RSS URL**

[`open-uri`](https://rubygems.org/gems/net-http/versions/0.4.1?locale=en) gem is used to send an HTTP request to the RSS URL, and the XML from the response is parsed with [`simple-rss`](https://rubygems.org/gems/simple-rss) and  [`nokogiri`](https://rubygems.org/gems/nokogiri).  [`simple-rss`](https://rubygems.org/gems/simple-rss) are a handy gem that turns a RSS/Atom XML file into a Ruby object which contains  the contents of the more common tags of the XML file. [`nokogiri`](https://rubygems.org/gems/nokogiri) is particularly used to grab `img` text from HTML content tags when no image thumbnail tags are directly available from the XML. The schema used to parse the XML file (in XmlParser service object) is built upon 39 test XML files. Therefore, in general, most RSS urls should be able to return an XML that is parsable by the program.

**Detecting Languages of The Articles**

As per the ERD above, the publisher have an bilingual attribute which means they can have more than one language. If it is the case, [`google-cloud-translate-v2`](https://rubygems.org/gems/google-cloud-translate-v2i) gem is used to interact with the [Google Cloud Translation API](https://cloud.google.com/translate/docs/reference/rest) in order to detect which language are used in each of their articles. If it is not in Malay or English, the articles are categorised by their publisher's language.

**Categorising the Articles**

The articles are categorised using [Google Cloud Natural Language API](https://cloud.google.com/natural-language?hl=en) via [`google-cloud-language-v2`](https://rubygems.org/search?query=google-cloud-language-v2) gem. When parsing the articles, a description of the article is scraped from the XML. The description is then passed to the Natural Language API to be categorised accordingly (even so, the accuracy is not 100%). The response from the API is then mapped to a category that is already available in the program. If the text is in another language, the text is first translated to English (using Cloud Translation), and then passed to the API for categorisation.

**Scheduled Article Creation**

The initial fetching, parsing and creating new articles are done asynchronously via a [`sidekiq`](https://rubygems.org/gems/sidekiq) job. After the initial background job is complete, the task of creating articles for the publisher will be scheduled to run again one hour later. In summary, the background job of fetching, parsing and creating new articles will occur every hour after the creation of a publisher. Note that,  [`sidekiq`](https://rubygems.org/gems/sidekiq) jobs are also used to delete articles after 2 days of its' creation to clear up space in the database.

## Local Development

### Dependencies

* Ruby version 3.3.6
* Ruby on Rails 8.0.0
* PostgresSQL
* Redis 7.2+ for background jobs
* TailwindCSS
* [`google-cloud-translate-v2`](https://rubygems.org/gems/google-cloud-translate-v2i) gem
* [`google-cloud-language-v2`](https://rubygems.org/search?query=google-cloud-language-v2) gem
* [`nokogiri`](https://rubygems.org/gems/nokogiri) gem
* [`simple-rss`](https://rubygems.org/gems/simple-rss) gem
* [`sidekiq`](https://rubygems.org/gems/sidekiq) gem
* [`devise`](https://rubygems.org/gems/devise) gem - for admin-only pages auth
* [`pagy`](https://rubygems.org/gems/pagy) gem - for articles pagination

### Installing

* Make sure you have the correct version of Ruby (3.3.6)
* Get your API key for [Google Cloud Translation API](https://cloud.google.com/translate/docs/reference/rest)  and keyfile for service account for [Google Cloud Natural Language API](https://cloud.google.com/natural-language?hl=en)
* Save the API keys in Rails credentials or .env
* Save the keyfile at root
* Clone this repo and run:
```
bundle install
```

## Testing
Test files are available at `/test`. Most tests for this repo is on parsing XML files to find a schema that would fit most RSS/Atom formats.

Start Redis server and run `rails test` to run test suite!

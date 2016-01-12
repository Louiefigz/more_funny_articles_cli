require 'pry'
class Article

  attr_accessor :header, :description, :article
  
  @@all = [] 

  def initialize(header, description)
    @header = header 
    @description = description 
    @@all << self

  end 

  def self.all
    @@all
  end 

  def self.scrape_article(cat_url, all_index)
     doc = Nokogiri::HTML(open(cat_url))
     article_links = []
     doc.css('.large-thing h2 a').map do |link| 
       article_links << "http://www.theonion.com" + "#{link['href']}"
     end 
    
     url = article_links[all_index.to_i]
     new_doc = Nokogiri::HTML(open(url))
    

     
     @@all[all_index].article = new_doc.css('.content-text').text.strip == '' ? "No article provided" : new_doc.css('.content-text').text.strip

     # array = []
     # new_doc.css('.content-media .image') ? array << "Image" : array << "No Image"
     # new_doc.css('.content-text').text.strip == '' ? array << "No article provided" : array << new_doc.css('.content-text').text.strip
     @@all[all_index]
   end



end 
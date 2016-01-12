class Categories

  def initialize(category_url)
    doc = Nokogiri::HTML(open(category_url))
      scrape = doc.css('.large-thing')
      scrape.css('.inner').each do |div|
        header = div.css("h2").text.strip
        description = div.css('.desc').text.strip
        if description == ""
          description = "no description provided"
        end
        Article.new(header,description)
    end
  end

end 
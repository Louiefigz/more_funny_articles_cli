require 'pry'
class CLI

@@list = [
    {"politics" => 'http://www.theonion.com/section/politics/'},
    {"sports" => 'http://www.theonion.com/section/sports/'}, 
    {"local"=> 'http://www.theonion.com/section/local/'}, 
    {"business" => 'http://www.theonion.com/section/business'}, 
    {"entertainment" => 'http://www.theonion.com/section/entertainment/'}, 
    {"science technology" => 'http://www.theonion.com/section/science-technology/'}, 
    {"after birth" => 'http://www.theonion.com/section/after-birth'}]

  def start
    puts "*************Welcome to the article scraper!!!!!!********"

    @@list.each.with_index {|c, i| puts "#{i+1}.  #{c.keys[0]}"}

    puts "Which category would you like to read?  Choose a number on the list or enter 'exit': "

    input = gets.strip.downcase
        if input == "exit"
            puts "Good bye!"
            exit
        end 

        else 
            if input.to_i <= @@list.count
                Categories.new(@@list[input.to_i - 1].values[0])
            else
                puts "///////////Please select a number from the list above//////////////"
                start
            end 

            Article.all.each.with_index {|c, i| puts "\n\n #{i+1}.  HEADLINE:\n#{c.header}\n\n DESCRIPTION:\n#{c.description}\n"}

            puts "\nWhich article would you like to read? Choose the number: "

            input_2 = gets.strip.to_i

                
        if input_2 <= Article.all.count
            article = Article.scrape_article(@@list[input.to_i - 1].values[0], input_2 - 1)
            puts "--------------------------------------------------------------------"

            puts "\nHEADLINE:\n#{article.header} \n\nARTICLE:\n#{article.article}"
            puts ""
            puts "--------------------------------------------------------------------"
        else
             puts "///////////Please select a number from the list above//////////////"
            start
        end 

            restart
  end

  def restart
    puts "Would you like to read another article? Enter (y/n)"
    input = gets.strip.downcase 
    if input == "y"
        start
    else
        puts "Goodbye!!!!"
        exit
    end 
  end 

  


end 
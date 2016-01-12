class CLI

  def start
    puts "*************Welcome to the article scraper!!!!!!********"

    Categories.all.each.with_index {|c, i| puts "#{i+1}.  #{c.keys[0]}"}


        # list out categories
        # takes in user input 
        # returns the header  
        # returns description
        # asks for user input for article
        # returns article
        # asks if you want to start over.



  end

end 
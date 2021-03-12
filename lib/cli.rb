class CLI

    def run
        puts "Welcome to the Star Wars Character database!"
        puts "Please choose a character to see more information:"
        Scraper.scrape_characters
        list_characters
        menu
    end

    def list_characters
        Character.all.each.with_index(1) do | character, i|
          puts "#{i}. #{character.name}"
        end
    end

    def menu    
        puts "Please select a number to get the details."
        input = gets.chomp
        if !input.to_i.between?(1, Character.all.count)
            puts "Character not found. Please select a different character!"
            list_characters
            menu
        else
            character = Character.all[input.to_i-1]
            display_character_details(character)
        end
    end

    def display_character_details(char)
        Scraper.scrape_ind_characters(char)
        puts "Here are the character details for #{char.name}:"
        puts "#{char.quote}"
        puts "#{char.powers}"
        puts "Want more? Visit https://disney.fandom.com/#{char.url}"
    end

end
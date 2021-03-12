class Scraper

    RELATIVE_URL = "https://disney.fandom.com/"

    def self.scrape_characters
        html = open("https://disney.fandom.com/wiki/Category:Star_Wars_characters")
        doc = Nokogiri::HTML(html)
        doc.css("li.category-page__member").each do | char |
            name = char.css('a').text.strip
            url = char.css('a').attr("href").value

            Character.new(name, url)
            binding.pry
        end
    end


    def self.scrape_ind_characters(char)
        html = open(RELATIVE_URL+char.url)
        doc = Nokogiri::HTML(html)

        char.quote = doc.css("div[data-source='quote']").text.strip
        char.powers = doc.css("div[data-source='powers']").text.strip
        # get some stuff

    end


end

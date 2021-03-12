class Character

    attr_accessor :name, :url, :quote, :powers

    @@all = []

    def initialize(name, url)
        @name = name
        @url = url
        @@all << self
    end

    def self.all
        @@all
    end

end
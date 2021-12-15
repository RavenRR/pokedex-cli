class Pokemon

    attr_accessor :name, :url, :height, :weight, :type, :id

    @@all = [ ]

    def initialize(name:, url:)
        @name = name
        @url = url
        @@all << self
    end

    def self.all
        @@all
    end
end
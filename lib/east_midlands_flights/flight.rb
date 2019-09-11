module EastMidlandsFlights
    class Flight

        attr_accessor :destination, :price, :date, :airline, :url

        @@all = []

        def initialize(attributes = {})
            @destination = attributes[:destination]
            @price = attributes[:price]
            @date = attributes[:date]
            @airline = attributes[:airline]
            @url = url
          
            @@all << self
       
         end 
        
        def self.get_flights
            EastMidlandsFlights::Scraper.scrape_flights
        end

        def self.all
            @@all 
        end  

        def self.find(input)
            self.all[input-1]
        end
    end
  end
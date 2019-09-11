module EastMidlandsFlights
    class Scraper
       
        attr_accessor :destination, :price, :date, :airline, :url, :flight_number

        def self.scrape_flights
            doc =  Nokogiri::HTML(open("https://fly.eastmidlandsairport.com/flights/"))

                doc.css("div.nbf_tpl_pagesection_linked_norwd.linked_flight").each do |flight_details|
                    flight_destination = flight_details.css("div.nbf_tpl_text.flight_arrival_airport").text
                    flight_price = flight_details.css("div.nbf_tpl_text.price_pp").text
                    flight_date = flight_details.css("div.nbf_tpl_text.outbound_date").text
                    flight_url = flight_details.css("a").attr("href").value
                    # binding.pry

                    Flight.new({destination: flight_destination, price: flight_price, date: flight_date, url: flight_url})
                 end
        end

        def self.scrape_details

        end
    end
  end
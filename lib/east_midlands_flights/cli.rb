module EastMidlandsFlights
    class CLI


        def call
            puts "Welcome to East Midlands Airport. We are getting the current flights for you..."

            EastMidlandsFlights::Flight.get_flights

            puts "Here are the current available flights:"
            list_flights
        end

        def list_flights
            EastMidlandsFlights::Flight.all.each.with_index(1) { |flight, index| puts "#{index}. #{flight.destination}"} 
            choose_offer
        end

        def choose_offer
            while @input != "exit"

             puts "Which flight would you like more info on?"

             @input = gets.strip.downcase

                if (1..EastMidlandsFlights::Flight.all.size).include?(@input.to_i)
                    flight = EastMidlandsFlights::Flight.find(@input.to_i)
                    print_flight
                 elsif @input == "list"
                    list_flights   
                elsif @input == "exit"
                    goodbye
                else
                    puts "Huh? Try again! Pick a number, type 'list' or 'exit'".colorize(:red)
                end  
            end
        end

        def print_flight
            puts "Here are the flight details:"
        end

        def goodbye
            puts "Come back soon for more flights!"
            exit
        end
    end
  end
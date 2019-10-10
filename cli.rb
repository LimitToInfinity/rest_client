class CLI
    
    def self.getAPI
        @response_hash = JSON.parse(RestClient.get("https://rickandmortyapi.com/api/character/"))
    end
    
    def self.characters
        getAPI
        @response_hash["results"].each { |character| puts character["name"] }
    end
    
    def self.species
        getAPI
        @response_hash["results"].each { |character| puts character["species"] }
    end
        
    def self.characters_with_status
        getAPI
        @response_hash["results"].each do |character|
            puts "#{character["name"]} - #{character["status"]}" 
        end
    end
    
    def self.characters_with_species_and_status
        getAPI
        @response_hash["results"].each do |character|
            puts "#{character["name"]} - #{character["species"]} - #{character["status"]}" 
        end
    end
        
        def self.main_menu
            puts "Hey would you like to see some Rick and Morty characters? Please enter 'y' or 'n'"
            @user_response = gets.strip.downcase
            if @user_response == "y"
                characters
            else
                puts "Too Bad"
                main_menu
            end
    end

end
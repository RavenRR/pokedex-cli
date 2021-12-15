class CLI
    def run
        greeting
        API.grab_pokemons
        self.menu
    end

    def greeting
        puts "Welcome Pokemaster!"
    end

    def menu
        puts "Would you like to explore the world of Pokemon?"
        sleep(2)
        puts "Y/N?"
        input = gets.strip.downcase

        if input == "y"
            puts "Here we go!"
            self.display_list_of_pokemons
        elsif input == "n"
            puts "Farewell!"
        else
            puts "invalid choice"
            menu
        end
    end

    def display_list_of_pokemons

        Pokemon.all.each.with_index do |pokemon, index|
            puts "#{index+1}. #{pokemon.name}" 
        
        end
    end
end
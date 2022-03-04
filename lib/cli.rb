class CLI
    def run
        self.pokedex_logo
        greeting
        API.grab_pokemons
        self.menu
        loop_or_exit
    end

    def greeting
        puts"----------------------------"
        puts "Welcome Pokemaster!"
        puts"----------------------------"
    end

    def menu
        puts "Would you like to explore the world of Pokemon?"
        puts"----------------------------"
        sleep(2)
        puts "Y/N?"
        puts"----------------------------"
        input = gets.strip.downcase

        if input == "y"
            puts "Here we go!"
            self.display_list_of_pokemons
            self.user_pokemon_choice
        elsif input == "n"
            puts "Farewell!"
            exit
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

    def loop_or_exit
        puts"----------------------------"
        puts "Would you like to view more? Please enter Y/N"
        puts"----------------------------"
        input = gets.strip.downcase

        if input == "y"
            self.display_list_of_pokemons
            self.user_pokemon_choice

        elsif input == "n"
            puts"----------------------------"
            puts "Farewell Pokemaster!"
            puts"----------------------------"
            exit
        
        else
            puts"----------------------------"
            puts "Invalid choice"
            loop_or_exit
        end
    end

    def user_pokemon_choice

        puts"----------------------------"
        puts "Enter a number to the Pokemon you'd like to learn more about."
        puts"----------------------------"
        pokemon_choice_index = gets.strip.to_i - 1
        max_limit = Pokemon.all.length - 1
        puts"----------------------------"

        until pokemon_choice_index.between?(0,max_limit)
            puts "Invalid choice"
            sleep(2)
            loop_or_exit
            pokemon_choice_index = gets.strip.to_i - 1  #If invalid user will be asked again
        end

        #User's pokemon choice
        pokemon_object_lookup = Pokemon.all[pokemon_choice_index]
        sleep(2)
        puts "Let's see what there is to learn!"
        puts"----------------------------"
        sleep(2)
        API.pokemon_info(pokemon_object_lookup)
        self.display_pokemon_info(pokemon_object_lookup)
    end

    def display_pokemon_info(pokemon_object_lookup)
        #details displayed for user
        
        puts "Name: #{pokemon_object_lookup.name}"
        sleep(1)
        puts "Type: #{pokemon_object_lookup.type}"
        sleep(1)
        puts "Ability: #{pokemon_object_lookup.abilities}"
        sleep(1)
        puts "Move: #{pokemon_object_lookup.moves}"
        sleep(1)
        puts "Height: #{pokemon_object_lookup.height}"
        sleep(1)
        puts "Weight: #{pokemon_object_lookup.weight}"
        sleep(1)
        loop_or_exit
    end

    def pokedex_logo
        file = File.open("./lib/pokedex.txt")
        puts file.read
    end	  
end
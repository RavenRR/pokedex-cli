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
            self.user_pokemon_choice
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
    def user_pokemon_choice

        puts"----------------------------"
        puts "Enter a number to the Pokemon you'd like to learn more about."
        puts"----------------------------"
        pokemon_choice_index = gets.strip.to_i - 1
        max_limit = Pokemon.all.length - 1
        puts"----------------------------"

        until pokemon_choice_index.between?(0,max_limit)
            puts "Invalid choice"
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
    end
end
class CLI
    def run
        greeting
        menu
        API.grab_pokemons
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
        elsif input == "n"
            puts "Farewell!"
        else
            puts "invalid choice"
            menu
        end
    end
end
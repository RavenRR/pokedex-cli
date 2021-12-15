class CLI
    def run
        greeting
        menu
        API.grab_pokemons
        binding.pry
    end

    def greeting
        puts "Welcome Pokemaster!"
    end

    def menu
        puts "Select a Pokemon"
    end
end
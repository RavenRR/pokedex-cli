class API
    def self.grab_pokemons

        url = "https://pokeapi.co/api/v2/pokemon?limit=151"
        uri = URI(url)
        response = Net::HTTP.get(uri)
        hash = JSON.parse(response)
        pokemons_array = hash["results"]

        pokemons_array.each do |pokemon|
            Pokemon.new(name: pokemon["name"], url: pokemon["url"])
        end
    end
end

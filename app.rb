require "sinatra"
require "sinatra/reloader"
require "http"

get("/") do
  erb(:index)
end

get("/generate_pokemon_team") do
  @random_poke_indexes=1.times.map{rand(1..1025).to_s} #adjust the number to 6 later. for now develop app for one pokemon.
  poke_api_url= "https://pokeapi.co/api/v2/pokemon/"
  @pokemon_team_data=[]
  
  @random_poke_indexes.each do |poke_index|
    response= HTTP.get(poke_api_url+poke_index)
    @pokemon_team_data << JSON.parse(response)
  end
  

  erb(:generate_pokemon_form)
end

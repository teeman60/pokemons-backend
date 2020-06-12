class PokemonsController < ApplicationController
    def index
        @pokemons = Pokemon.all 
        render json: @pokemons
        # render json: birds, only: [:id, :name, :species]
    end

    def create
        pokemon = Pokemon.new(pokemons_params)
        pokemon.nickname = Faker::Name.first_name
        pokemon.species = Faker::Games::Pokemon.name
        # trainer_id = trainerId
        # byebug
        pokemon.save
        render json: pokemon

    end
    
    # def show
    #     pokemon = Pokemon.find_by(id: params[:id])
    #     render json: pokemon
    #     # render json: {id: bird.id, name: bird.name, species: bird.species }
    #     # if bird
    #     #     render json: { id: bird.id, name: bird.name, species: bird.species }
    #     #   else
    #     #     render json: { message: 'Bird not found' }
    #     #   end
    # end

    def destroy
        # byebug
        pokemon = Pokemon.find_by(params[:id])
        pokemon.destroy
    end

    def pokemons_params
        params.require(:pokemon).permit!
        render json: pokemon

    end
end

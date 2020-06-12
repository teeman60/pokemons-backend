class TrainersController < ApplicationController

    def index
        @trainers = Trainer.all 
        render json: @trainers, include: :pokemons
        # render json: birds, only: [:id, :name, :species]

    end

    def show
        trainer = Trainer.find_by(id: params[:id])
        render json: trainer
        # render json: {id: bird.id, name: bird.name, species: bird.species }
        # if bird
        #     render json: { id: bird.id, name: bird.name, species: bird.species }
        #   else
        #     render json: { message: 'Bird not found' }
        #   end
    end
end

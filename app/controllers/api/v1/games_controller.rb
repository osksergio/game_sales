# frozen_string_literal: true

#class Api::V1::GamesController < ApplicationController
#
#end
 
module Api
  module V1
    # controller games
    class GamesController < ApplicationController
      def index
        games = Game.all
        render json: games, status: :ok
      end

      def show
        game = Game.find(params[:id])
        render json: game, status: :ok
      end

      def create
        game = Game.new(game_params)
        game.save!
        render json: game, status: :created
      rescue StandardError
        head(:unprocessable_entity)
      end

      def update
        game = Game.find(params[:id])
        game.update!(game_params)
        render json: game, status: :ok
      rescue StandardError
        head(:unprocessable_entity)
      end

      def delete
        game = game.find(params[:id])
        game.destroy!
        render json: game, status: :ok
      rescue StandardError
        head(:not_found)
      end

      private

      def game_params
        params.require(:game).permit(
          :title,
          :genre,
          :platform,
          :release
        )
      end
    end
  end
end

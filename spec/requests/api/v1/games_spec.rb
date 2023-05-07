# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::V1::Games', type: :request do
  describe 'GET /index' do
    before do
      # game creation through factory
      create(:game)
      create(:game)

      get '/api/v1/games/index'
    end

    it 'returns an ok status' do
      expect(response).to have_http_status(:ok)
    end

    it 'returns with json' do
      expect(response.content_type).to eq('application/json; charset=utf-8')
    end

    it 'returns 2 elements' do
      expect(JSON.parse(response.body).size).to eq(2)
    end
  end

  describe 'GET /show' do
    let(:new_game) { create(:game) }

    context 'when game exist' do
      before { get "/api/v1/games/show/#{new_game.id}" }

      it { expect(response).to have_http_status(:ok) }

      it 'returns with json' do
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end
    end

    context 'when game does not exist' do
      before do
        new_game.destroy
        get "/api/v1/games/show/#{new_game.id}"
      end

      it { expect(response).to have_http_status(:not_found) }

      it 'does not return a json' do
        expect(response.content_type).not_to eq('application/json; charset=utf-8')
      end
    end
  end

  describe 'POST /create' do
    let(:params) do
      {
        title: 'Game RSpec',
        genre: 'Horror',
        platform: 'Windows',
        release: '20-02-1998'
      }
    end

    context 'with valid params' do
      before do
        post '/api/v1/games/create', params: { game: params }
      end

      it 'returns a success response' do
        expect(response).to have_http_status(:created)
      end

      it 'creates the game' do
        new_game = Game.find_by(title: 'Game RSpec')
        expect(new_game).not_to be_nil
      end
    end
  end

  describe 'DELETE /delete' do
    let(:game_x) { create(:game, id: 1) }

    context 'context when game exist' do
      before { delete "/api/v1/games/delete/#{game_x.id}" }

      it { expect(response).to have_http_status(:ok) }

      it 'deletes the game' do
        deleted_game = Game.find_by(id: 1)
        expect(deleted_game).to be_nil
      end
    end

    context 'context when game does not exist' do
      before do
        game_x.destroy
        delete "/api/v1/games/delete/#{game_x.id}"
      end

      it { expect(response).to have_http_status(:not_found) }
    end
  end

  describe 'PUT /update' do
    let(:game_y) { create(:game, title: 'Resident Evil 4') }
    
    context 'when game exists' do
      before do
        put "/api/v1/games/update/#{game_y.id}", params: { game: { title: 'Medal of Honor' } }
      end

      it 'responds with an ok status' do
        expect(response).to have_http_status(:ok)
      end

      it 'changes title' do
        updated_game = Game.find_by(id: game_y.id)
        expect(updated_game.title).to eq('Medal of Honor')
      end

    end
  end
end

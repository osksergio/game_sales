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
end

require 'rails_helper'

RSpec.describe 'Api::V1::Games', type: :request do
  describe 'GET /index' do
    before do
      # game creation through factory
      create(:game, title: 'game1')
      create(:game, title: 'game2')

      get '/api/v1/games/index'
    end

    it 'returns an ok status' do
      expect(response).to have_http_status(:ok)
    end
  end
end

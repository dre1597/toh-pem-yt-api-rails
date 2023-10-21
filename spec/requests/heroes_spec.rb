require 'rails_helper'

# rubocop:disable Metrics/BlockLength
RSpec.describe '/api/heroes', type: :request do
  let(:name) { 'any_name' }

  let(:valid_attributes) do
    { name: }
  end

  let(:invalid_attributes) do
    { name: nil }
  end

  let(:valid_headers) do
    {}
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      Hero.create! valid_attributes
      get api_heroes_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      hero = Hero.create! valid_attributes
      get api_hero_url(hero), headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Hero' do
        expect do
          post api_heroes_url,
               params: { hero: valid_attributes }, headers: valid_headers, as: :json
        end.to change(Hero, :count).by(1)
      end

      it 'renders a JSON response with the new hero' do
        post api_heroes_url,
             params: { hero: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Hero' do
        expect do
          post api_heroes_url,
               params: { hero: invalid_attributes }, headers: valid_headers, as: :json
        end.to change(Hero, :count).by(0)
      end

      it 'renders a JSON response with errors for the new hero' do
        post api_heroes_url,
             params: { hero: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_name) { 'updated_name' }

      let(:new_attributes) do
        { name: new_name }
      end

      it 'updates the requested hero' do
        hero = Hero.create! valid_attributes
        patch api_hero_url(hero),
              params: { hero: new_attributes }, headers: valid_headers, as: :json
        hero.reload
        expect(hero.name).to eq(new_name)
      end

      it 'renders a JSON response with the hero' do
        user = Hero.create! valid_attributes
        patch api_hero_url(user),
              params: { hero: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      it 'renders a JSON response with errors for the hero' do
        user = Hero.create! valid_attributes
        patch api_hero_url(user),
              params: { hero: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested hero' do
      user = Hero.create! valid_attributes
      expect do
        delete api_hero_url(user), headers: valid_headers, as: :json
      end.to change(Hero, :count).by(-1)
    end
  end
end

# rubocop:enable Metrics/BlockLength

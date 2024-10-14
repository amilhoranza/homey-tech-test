require 'rails_helper'

RSpec.describe Api::V1::ProjectsController, type: :request do
  let!(:projects) { create_list(:project, 3) }
  let(:project) { projects.first }
  let(:headers) { { 'Authorization' => JsonWebToken.encode(user_id: user.id) } }
  let(:user) { create(:user) }

  describe 'GET #index' do
    it 'returns a list of projects' do
      get '/api/v1/projects', headers: headers

      expect(response).to have_http_status(:ok)
      body = JSON.parse(response.body)
      expect(body.size).to eq(3)
    end
  end

  describe 'GET #show' do
    context 'when project exists' do
      it 'returns the project with its history' do
        get "/api/v1/projects/#{project.id}", headers: headers

        expect(response).to have_http_status(:ok)
        body = JSON.parse(response.body)
        expect(body['project']['id']).to eq(project.id)
        expect(body).to have_key('history')
      end
    end

    context 'when project does not exist' do
      it 'returns a 404 status' do
        get "/api/v1/projects/999", headers: headers

        expect(response).to have_http_status(:not_found)
      end
    end
  end

  describe 'POST #create' do
    context 'with valid parameters' do
      let(:valid_params) { { project: { name: 'New Project', status: 'pending' } } }

      it 'creates a new project' do
        expect {
          post '/api/v1/projects', params: valid_params, headers: headers
        }.to change(Project, :count).by(1)

        expect(response).to have_http_status(:created)
        body = JSON.parse(response.body)
        expect(body['name']).to eq('New Project')
      end
    end

    context 'with invalid parameters' do
      let(:invalid_params) { { project: { name: '' } } }

      it 'returns errors and does not create a project' do
        expect {
          post '/api/v1/projects', params: invalid_params, headers: headers
        }.not_to change(Project, :count)

        expect(response).to have_http_status(422)
        body = JSON.parse(response.body)
        expect(body['errors']).to include("Name can't be blank")
      end
    end
  end
end

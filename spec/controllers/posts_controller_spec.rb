require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  let(:valid_attributes) do
    { title: 'Test title!', body: 'This is a test description', ispublished: false }
  end

  let(:valid_session) { {} }

  describe 'GET #index' do
    it 'returns a success response' do
      Post.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_successful # be_successful expects a HTTP Status code of 200
      # expect(response).to have_http_status(302) # Expects a HTTP Status code of 302
    end
  end
end

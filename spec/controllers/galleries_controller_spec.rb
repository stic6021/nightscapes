require 'rails_helper'

RSpec.describe GalleriesController, type: :controller do
  describe "galleries#index" do
    it "should show the Aspen and Evergreen gallery info page" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end
end

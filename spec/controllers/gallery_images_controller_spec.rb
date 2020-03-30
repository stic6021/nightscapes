require 'rails_helper'

RSpec.describe GalleryImagesController, type: :controller do
  describe "gallery_images#index" do
    it "should show the landscape and portrait gallery images" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end
  describe "gallery_images#show" do
    it "should show an image that fills the viewport" do
      gi = GalleryImage.new
      gi.save
      get :show, params: { id: gi.id }
      expect(response).to have_http_status(:success)
    end
  end
end

class GalleryImagesController < ApplicationController
  def index
    @landscapes = GalleryImage.all_landscapes
    @portraits = GalleryImage.all_portraits
  end

  def show
    @gallery_image = GalleryImage.find(params[:id])
  end
end

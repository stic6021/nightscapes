class AddAttribsToGalleryImages < ActiveRecord::Migration[5.2]
  def change
    add_column :gallery_images, :image_title, :string
    add_column :gallery_images, :image_description, :text
  end
end

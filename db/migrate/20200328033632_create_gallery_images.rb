class CreateGalleryImages < ActiveRecord::Migration[5.2]
  def change
    create_table :gallery_images do |t|
      t.string :image_name
      t.string :file_name
      # image_type will be 'landscape' or 'portrait'
      t.string :image_type
      t.timestamps
    end
  end
end

#
# NOTE: this is not a stand-alone script. It requires the Rails framework to do its job.
# The code is to be copied and pasted into a rails console and executed there.
#
def clean_gallery_images
  GalleryImage.delete_all
end

def insert_gallery_image(path)
  gi = GalleryImage.new
  gi.image_name = File.basename(path).gsub('.jpg', '')
  gi.file_name = path
  gi.image_type = 'JPEG'
  gi.save
end

clean_gallery_images
GalleryImage.all_landscapes.each { |path| insert_gallery_image(path) }
GalleryImage.all_portraits.each { |path| insert_gallery_image(path) }
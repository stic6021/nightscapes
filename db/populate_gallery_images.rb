#
# NOTE: this is not a stand-alone script. It requires the Rails framework to do its job.
# The code is to be copied and pasted into a rails console and executed there.
#
def clean_gallery_images
  GalleryImage.delete_all
end

def insert_gallery_image(path, imd, type)
  gi = GalleryImage.new
  gi.image_name = File.basename(path).gsub('.jpg', '')
  parent_discriminator = "//gallery-image[@data-name = \"#{gi.image_name}\"]"
  gi.image_title = imd.xpath("#{parent_discriminator}/image-title").text
  gi.image_description = imd.xpath("#{parent_discriminator}/image-description").text
  gi.file_name = path
  gi.image_type = type
  gi.save
end

img_meta_doc = GalleryImage.get_image_metadata
landscapes = GalleryImage.all_landscapes
portraits = GalleryImage.all_portraits

if img_meta_doc.nil? || !img_meta_doc.errors.empty? || landscapes.empty? || portraits.empty?
	puts("Something's not right. Leaving database unscathed.")
	exit(5)
end

clean_gallery_images
landscapes.each { |path| insert_gallery_image(path, img_meta_doc, 'landscape') }
portraits.each { |path| insert_gallery_image(path, img_meta_doc, 'portrait') }

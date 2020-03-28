class GalleryImage < ApplicationRecord
  GALLERY_IMAGE_SUBDIR = "EN-HD-images"
  GALLERY_IMAGE_ROOT = File.join(Rails.root, "app", "assets", "images", GALLERY_IMAGE_SUBDIR)

  # Returns a collection of paths suitable for use with image_tag.
  def self.all_landscapes
    full_paths = Dir.glob(File.join(GALLERY_IMAGE_ROOT, "landscape", "*.jpg")) rescue []
    return full_paths.map { |p| p.gsub(GALLERY_IMAGE_ROOT, GALLERY_IMAGE_SUBDIR) }
  end

  # Returns a collection of paths suitable for use with image_tag.
  def self.all_portraits
    full_paths = Dir.glob(File.join(GALLERY_IMAGE_ROOT, "portrait", "*.jpg")) rescue []
    return full_paths.map { |p| p.gsub(GALLERY_IMAGE_ROOT, GALLERY_IMAGE_SUBDIR) }
  end
end

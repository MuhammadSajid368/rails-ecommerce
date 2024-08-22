class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick # If you're using MiniMagick for image processing

  storage :file # Store files locally. For production, consider using cloud storage like AWS S3

  # Define the directory where uploaded files will be stored
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Create different versions of your uploaded files
  version :thumb do
    process resize_to_fit: [200, 200]
  end

  version :medium do
    process resize_to_fit: [800, 800]
  end

  # Allow only image files to be uploaded
  def extension_whitelist
    %w(jpg jpeg gif png)
  end
end

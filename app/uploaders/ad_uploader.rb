# encoding: utf-8

class AdUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick

  version :wednesday do
    process :resize_to_fit => [200, 150]
  end

  version :sunday do
    process :resize_to_fit => [260, 200]
  end

  version :classified do
    process :resize_to_fit => [145, 200]
  end

  # Include RMagick or MiniMagick support:
  # include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  storage Rails.env.production? ? :aws : :file

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "#{Rails.env}/uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{name_in_subfolder}"
  end

  def name_in_subfolder
    files_in_folder = 1000
    subfolder = (model.id / files_in_folder) + 1 # (1 / 1000) + 1 => 1\
    "#{subfolder}/#{model.id}"
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process :scale => [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  # version :thumb do
  #   process :scale => [50, 50]
  # end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  # def extension_white_list
  #   %w(jpg jpeg gif png)
  # end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end

end

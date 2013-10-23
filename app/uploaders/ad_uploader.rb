# encoding: utf-8

class AdUploader < BaseUploader
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

  def extension_white_list
    %w(jpg jpeg gif png)
  end
end

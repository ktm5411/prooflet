# encoding: utf-8

class UserPhotoUploader < BaseUploader
  include CarrierWave::RMagick
  
  process :resize_to_fit => [87, 87]

  def extension_white_list
    %w(jpg jpeg gif png)
  end
end

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable, :rememberable, :trackable, :recoverable, :validatable
  devise :database_authenticatable, :registerable, :validatable

  belongs_to :company

  mount_uploader :photo, UserPhotoUploader
end

class Advertiser < User
  devise :database_authenticatable, :registerable

  has_many :ads, :dependent => :nullify
#  belongs_to :company
end

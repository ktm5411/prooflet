class Advertiser < User
  has_many :ads, :dependent => :nullify
end

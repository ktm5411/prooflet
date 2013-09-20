class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable, :rememberable, :trackable, :recoverable, :validatable
  devise :database_authenticatable, :registerable

  belongs_to :company

  # defined in seed
  %w(admin advertisement user).each do |m|
    define_method "#{m}?" do # def seeker?
      has_role?(m.to_sym)    #   has_role?(:seeker)
    end                      # end
  end
  
  def role
    roles.first.try(:name)
  end
end

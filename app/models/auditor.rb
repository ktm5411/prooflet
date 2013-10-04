class Auditor < User
  devise :database_authenticatable, :registerable

#  belongs_to :company
end

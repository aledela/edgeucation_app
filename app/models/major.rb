class Major < ApplicationRecord
  has_many :college_majors
  has_many :colleges, through: :college_majors
end

class College < ApplicationRecord
  geocoded_by :zip_code
  after_validation :geocode, if: :zip_code_changed?
  has_many :college_majors
  has_many :majors, through: :college_majors
end

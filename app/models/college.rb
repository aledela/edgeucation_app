class College < ApplicationRecord
  def self.search(search)
    if search 
        where(["coll_name LIKE ?","%#{search}%"])
    else
        all
    end
  end 
end

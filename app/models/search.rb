class Search < ApplicationRecord
  def search_colleges
    colleges = College.all 
    colleges = colleges.where(['zip_code <= ?', zip_code]) if zip_code.present?
    colleges = colleges.where(['cost_att <= ?', cost_att]) if cost_att.present?

    return colleges
  end 
end

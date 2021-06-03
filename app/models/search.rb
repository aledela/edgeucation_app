class Search < ApplicationRecord
  def search_colleges
    colleges = College.all 
    colleges = colleges.where(['zip_code <= ? and zip_code >= ?', (zip_code.to_i+10000), (zip_code.to_i-10000).to_s]) if zip_code.present?
    colleges = colleges.where(['cost_att <= ?', cost_att]) if cost_att.present?

    return colleges
  end 
end

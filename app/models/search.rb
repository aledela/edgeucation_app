class Search < ApplicationRecord
  def search_colleges
    colleges = College.all 
    colleges = colleges.where(['coll_name LIKE ?', coll_name]) if coll_name.present?
    colleges = colleges.where(['zip_code LIKE ?', zip_code]) if zip_code.present?
    colleges = colleges.where(['cost_att LIKE ?', cost_att]) if cost_att.present?

    return colleges
  end 
end

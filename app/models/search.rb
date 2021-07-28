class Search < ApplicationRecord
  def search_colleges
    majorlist = Major.all
    colleges = College.all
    majorlist = majorlist.where(["subject LIKE ?","%" + subject + "%"]) if subject.present?
    
    if majorlist.size == 1
     colleges = majorlist.first.colleges
    end
     
    colleges = colleges.near(zip_code, 30, :order => :distance) if zip_code.present?
    colleges = colleges.where(['cost_att <= ?', cost_att]) if cost_att.present?
    # colleges = colleges.where(["subject LIKE ?", subject]) if subject.present?
    return colleges
  end 
end

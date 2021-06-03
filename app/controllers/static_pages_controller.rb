class StaticPagesController < ApplicationController
  def searchbar 
    if params[:search].blank?  
      redirect_to(root_path, alert: "Empty field!") and return  
    else
      @colleges = College.all.where("coll_name LIKE ?", "%" + params[:search ] + "%")  
    end  
  end

  def about
  end
end

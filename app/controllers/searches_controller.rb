class SearchesController < ApplicationController
  def show
      @search = Search.find(params[:id])
  end 

  def new 
      @search = Search.new
      @zip_code = College.distinct.pluck(:zip_code)
      @cost_att = College.distinct.pluck(:cost_att)
      @subject = Major.distinct.pluck(:subject)
  end

  def create
      @search = Search.create(search_params)
      redirect_to @search
  end 

  private

  def search_params
      params.require(:search).permit(:zip_code, :cost_att, :subject)
  end 
end
class ToppagesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    if user_signed_in? 
    @company_name = current_user.company_name
    @jobs = current_user.jobs
    else
    @jobs = Job.all
    end 
  end

  def search
    #Viewのformで取得したパラメータをモデルに渡す
    @jobs = Job.search(params[:keyword])
  end

  
end

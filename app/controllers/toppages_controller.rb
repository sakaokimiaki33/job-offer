class ToppagesController < ApplicationController
  before_action :authenticate_user!
  before_action :move_to_signin, except: [:index, :edit, :update]

  def index
    # @jobs = Job.all.order('id DESC').limit(30)
    @company_name = current_user.company_name
    # @job = Job.find(params[:id])
    @jobs = current_user.jobs
  end

  def search
    #Viewのformで取得したパラメータをモデルに渡す
    @jobs = Job.search(params[:keyword])
  end

  private

  def move_to_signin
    redirect_to '/users/sign_in' unless user_signed_in?
  end

  
end

class ToppagesController < ApplicationController

  def index
    # @jobs = Job.all.order('id DESC').limit(30)
    # @company_name = current_user.company_name
    # @job = Job.find(params[:id])
    # @job = current_user.job
    # @user = User.find(current_user.id)
    @jobs = current_user.jobs
  end

  def search
    #Viewのformで取得したパラメータをモデルに渡す
    @jobs = Job.search(params[:keyword])
  end

end

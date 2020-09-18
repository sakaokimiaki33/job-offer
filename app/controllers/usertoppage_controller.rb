class UsertoppageController < ApplicationController
  # before_action :authenticate_user!, except: [:index, :show, :search]
  # before_action :move_to_signin, except: [:index, :show, :edit, :update, :search]

  def index
    # @jobs = Job.all.order('id DESC').limit(30)
    @jobs = Job.where(['working_hours LIKE ?', "%#{'kiki'}%"])
    # @company_name = current_user.company_name
    # @job = Job.find(params[:id])
    # @job = current_user.job
    # @user = User.find(params)
  end

  def show
    @job = Job.find(params[:id])
  end


  def search
    #Viewのformで取得したパラメータをモデルに渡す
  #   if params[:search].present?
  #     @jobs = Job.where('working_hours LIKE ?', "%#{params[:keyword]}%")

  #   else
  #     @jobs = Job.none
  # end
  jobs = Job.where('job_description LIKE ?', "%#{params[:keyword]}%")
  if jobs.blank?
    @jobs = Job.all
  else
    @jobs = Job.where('job_description LIKE ?', "%#{params[:keyword]}%")
    end
  end  

  private

  # def move_to_signin
  #   redirect_to '/users/sign_in' unless user_signed_in?
  # end
end

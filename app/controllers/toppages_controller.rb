class ToppagesController < ApplicationController
  before_action :authenticate_user!
  before_action :move_to_signin, except: [:index, :edit, :update]
  # before_action :set_job,only: [:show]
  before_action :move_to_index, except: [:index, :show, :search]

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
  
  def job_params
    params.require(:job).permit(:occupation, :Posting_start_date, :Posting_end_date, :employment_id, :job_description, :qualification, :salary, :treatment, :working_hours, :holiday, :work_location, :application_method, :contact, :location, :phone, :contact_name, :hp_address, :stop_id, :end_id, images_attributes: [:image]).merge(user_id: current_user.id, start_id: current_user.id)
  end

  def job_update_params
    params.require(:job).permit(:occupation, :Posting_start_date, :Posting_end_date, :employment_id, :job_description, :qualification, :salary, :treatment, :working_hours, :holiday, :work_location, :application_method, :contact, :location, :phone, :contact_name, :hp_address, :stop_id, :end_id, images_attributes:[:image, :_destroy, :id])
  end

  def move_to_signin
    redirect_to '/users/sign_in' unless user_signed_in?
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
  
end

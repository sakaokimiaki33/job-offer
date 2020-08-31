class JobsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :move_to_signin, except: [:index, :edit, :update]
  before_action :limit_editer, only: [:edit, :update]

  def search
    #Viewのformで取得したパラメータをモデルに渡す
    @jobs = Job.search(params[:keyword])
  end

  def new
    @job = Job.new
    @job.images.new
    @user = current_user
  end

  def create
    @job = Job.new(job_params)
    if @job.save
      redirect_to toppages_path notice: "登録に成功しました"
    else
      @job.images.new
      render :new
      # render :new alert: @job.errors.full_messages
    end
  end

  def show
    @job = Job.find(params[:id])
  end

  def edit
    @job = Job.find(params[:id])
  end

  def update
    @job = Job.find(params[:id])
    if @job.update(job_update_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    job = Job.find(params[:id])
    if job.start_id == current_user.id
      job.destroy
      redirect_to root_path
    end
  end

  def search
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

  def limit_editer
    unless Job.find(params[:id]).start_id.to_i == current_user.id
      redirect_to root_path
    end
  end
  
end

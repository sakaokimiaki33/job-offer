class ApplicationController < ActionController::Base
  before_action :basic_auth,if: :production?
  before_action :configure_permitted_parameters, if: :devise_controller?
    # Devise でメールアドレスとパスワード以外の値を受け取る為にストロングパラメータ（ "configure_permitted_parameters" メソッド）を設定する。
  protect_from_forgery with: :exception

  # rescue_from StandardError, with: :render_500 unless Rails.env.development?
  # rescue_from ActiveRecord::RecordNotFound, with: :render_404 unless Rails.env.development?

  # def render_404(e = nil)
  #   if e
  #     logger.error e 
  #     logger.error e.backtrace.join("\n") 
  #   end

  #   render template: 'errors/error404', status: 404, layout: 'application', content_type: 'text/html'
  # end

  protected
  def configure_permitted_parameters
    #下記カラム名を訂正要
    devise_parameter_sanitizer.permit(:sign_up, keys: [:user_img, :company_name, :company_name_kana, :business_content, :staff_name, :staff_name_kana, :URL, :phone, :faxphone, :address_attributes => [:company_name_deliver, :postal_code, :prefecture, :city, :block, :building]])
      # Devise の User モデルの新規登録フォームでメールアドレスとパスワード以外で受け取るカラム名を記述する。
      # ":address_attributes => [:カラム名]" で子モデルで受け取るためのカラム名を記述する。
  end

  private
  def production?
    Rails.env.production?
  end

  def basic_auth
      authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end
end

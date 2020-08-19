module ApplicationHelper
  def devise_error_messages
    return "" if resource.errors.empty?
    html = ""
    # エラーメッセージ用のHTMLを生成
    messages = resource.errors.full_messages.each do |msg|
      html += <<-EOF
        <div class="error_field alert alert-danger sign-up__contents__texts__error" role="alert">
          <p class="sign-up__contents__texts__error--msg">#{msg}</p>
        </div>
      EOF
    end
    html.html_safe
  end
end

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

  def current_member
    @current_member ||= Member.find_by id: session[:member_id] if session[:member_id]
  end

  def login_required
    return if current_member

    flash.alert = 'その画面・機能の利用にはログインが必要です。'
    redirect_to :root
  end

  helper_method :current_member
end

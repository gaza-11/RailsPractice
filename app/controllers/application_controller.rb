class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

  def login_required
    return if current_member

    flash.alert = 'その画面・機能の利用にはログインが必要です。'
    redirect_to :root
  end
end

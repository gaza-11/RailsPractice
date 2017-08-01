class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

  def current_member
    Member.find_by id: session[:member_id] if session[:member_id]
  end

  helper_method :current_member
end

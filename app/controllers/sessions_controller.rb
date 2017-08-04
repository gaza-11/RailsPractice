class SessionsController < ApplicationController
  def create
    member = Member.authenticate params[:name], params[:password]
    if member
      session[:member_id] = member.id
    else
      flash.alert = 'ユーザが存在しないか、パスワードとユーザ名が一致しません'
    end

    redirect_to :root
  end

  def index
    render
  end

  def destroy
    session.delete :member_id
    flash.notice = 'ログアウトしました'
    redirect_to :root
  end
end

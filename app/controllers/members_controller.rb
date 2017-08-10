# ログインユーザ登録・更新用コントローラ
class MembersController < ApplicationController
  before_action :login_required, except: %i[create new]

  def destroy
    @member = Member.find params[:id]
    @member.destroy
    flash[:notice] = '削除しました。'
    redirect_to :root
  end

  def delete
    @member = Member.find params[:id]
  end

  def update
    @member = Member.find params[:id]
    @member.assign_attributes member_params
    if @member.save
      flash[:notice] = '更新しました。'
      redirect_to :root
    else
      flash[:notice] = '更新に失敗しました。'
      render :edit
    end
  end

  def edit
    @member = Member.find params[:id]
  end

  def new
    @member = Member.new
  end

  def create
    @member = Member.new member_params
    if @member.save
      flash[:notice] = '登録しました。'
      redirect_to :root
    else
      flash[:notice] = '登録に失敗しました。'
      render :new
    end
  end

  private

  def member_params
    params.require(:member).permit(:id, :name, :password, :password_confirmation)
  end
end

class ActorsController < ApplicationController
  before_action :output_start_action_log
  after_action :output_end_action_log

  def index
    @actors = Actor.all
  end

  def destroy
    if current_member
      Actor.delete params[:id]
      flash[:notice] = '削除しました。'
      redirect_to action: 'index'
    else
      flash.notice = '削除するにはログインする必要があります'
      redirect_to action: :index
    end
  end

  def new
    if current_member
      @actor = Actor.new
    else
      flash.notice = '追加するにはログインする必要があります'
      redirect_to action: :index
    end
  end

  def edit
    if current_member
      @actor = Actor.find params[:id]
    else
      flash.notice = '更新するにはログインする必要があります'
      redirect_to action: :index
    end
  end

  def create
    if current_member
      @actor = Actor.new params[:actor].permit :first_name, :last_name, :birthday
      if @actor.save
        flash[:notice] = '登録しました。'
        redirect_to action: 'index'
      else
        flash[:notice] = '登録に失敗しました。'
        redirect_to action: 'new'
      end
    else
      flash.notice = '登録するにはログインする必要があります'
      redirect_to action: :index
    end
  end

  def update
    if current_member
      actor = params[:actor]
      @actor = Actor.find params[:id]
      @actor.assign_attributes(first_name: actor[:first_name], last_name: actor[:last_name], birthday: actor[:birthday])
      if @actor.save
        flash[:notice] = '更新しました。'
        redirect_to action: 'index'
      else
        flash[:notice] = '更新に失敗しました。'
        render action: 'edit'
      end
    else
      flash.notice = '更新するにはログインする必要があります'
      redirect_to action: :index
    end
  end

  def search
    @actors = Actor.filter_by_name params[:first_name], params[:last_name]
    render 'index'
  end

  private

  def output_start_action_log
    logger.debug "#{Time.now.instance_eval { '%s.%03d' % [strftime('%Y/%m/%d %H:%M:%S'), (usec / 1000.0).round] }} : action_start"
  end

  def output_end_action_log
    logger.debug "#{Time.now.instance_eval { '%s.%03d' % [strftime('%Y/%m/%d %H:%M:%S'), (usec / 1000.0).round] }} : action_end"
  end
end

class ActorsController < ApplicationController
  before_action :output_start_action_log
  after_action :output_end_action_log
  before_action :login_required, except: %i[index search]

  def index
    @actors = Actor.all
    respond_to do |format|
      format.html { @actors = @actors.page(params[:page]) }
      format.json { render json: @actors }
    end
  end

  def destroy
    Actor.delete params[:id]
    flash.notice = '削除しました。'
    redirect_to action: :index
  end

  def new
    @actor = Actor.new
  end

  def edit
    @actor = Actor.find params[:id]
  end

  def create
    @actor = Actor.new params[:actor].permit :first_name, :last_name, :birthday
    if @actor.save
      flash.notice = '登録しました。'
      redirect_to action: :index
    else
      flash.notice = '登録に失敗しました。'
      redirect_to action: :new
    end
  end

  def update
    actor = params[:actor]
    @actor = Actor.find params[:id]
    @actor.assign_attributes(first_name: actor[:first_name], last_name: actor[:last_name], birthday: actor[:birthday])
    if @actor.save
      flash.notice = '更新しました。'
      redirect_to action: :index
    else
      flash.notice = '更新に失敗しました。'
      render action: :edit
    end
  end

  def search
    @actors = Actor.filter_by_name(params[:first_name], params[:last_name]).page(params[:page])
    render action: :index
  end

  private

  def output_start_action_log
    logger.debug "#{Time.now.instance_eval { '%s.%03d' % [strftime('%Y/%m/%d %H:%M:%S'), (usec / 1000.0).round] }} : action_start"
  end

  def output_end_action_log
    logger.debug "#{Time.now.instance_eval { '%s.%03d' % [strftime('%Y/%m/%d %H:%M:%S'), (usec / 1000.0).round] }} : action_end"
  end
end

class ActorsController < ApplicationController
  before_action :output_start_action_log
  after_action :output_end_action_log

  def index
    @actors = Actor.all
  end

  def destroy
    Actor.delete params[:id]
    flash[:notice] = '削除しました。'
    redirect_to action:'index'
  end

  def new
    @actor = Actor.new
  end

  def edit
    @actor = Actor.find params[:id]
  end

  def create
    @actor = Actor.new params[:actor].permit :first_name, :last_name
    if @actor.save
      flash[:notice] = '登録しました。'
      redirect_to action:'index'
    else
      flash[:notice] = '登録に失敗しました。'
      render 'new'
    end
  end

  def update
    @actor = Actor.find params[:id]
    @actor.assign_attributes params[:actor].permit :first_name, :last_name
    if @actor.save
      flash[:notice] = '更新しました。'
      redirect_to action:'index'
    else
      flash[:notice] = '更新に失敗しました。'
      render 'edit'
    end
  end

  def search
    @actors = Actor.search params[:first_name], params[:last_name]
    render 'index'
  end

  private
  def output_start_action_log
    puts  "#{Time.now.instance_eval { '%s.%03d' % [strftime('%Y/%m/%d %H:%M:%S'), (usec / 1000.0).round] }} : action_start"
  end

  def output_end_action_log
    puts "#{Time.now.instance_eval { '%s.%03d' % [strftime('%Y/%m/%d %H:%M:%S'), (usec / 1000.0).round] }} : action_end"
  end
end

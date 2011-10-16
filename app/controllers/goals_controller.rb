class GoalsController < ApplicationController
  def index
    @goals = current_user.goals
  end

  def show
    @goal = current_user.goals.find_by_id(params[:id])
  end

  def new
    @goal = Goal.new(params[:goal]||{})
  end

  def create
    @goal = current_user.goals.build(params[:goal])
    if current_user.save
      redirect_to share_goal_path(@goal)
    else
      render :new
    end
  end

  def edit
    @goal = current_user.goals.find_by_id(params[:id])
  end

  def update
    @goal = current_user.goals.find_by_id(params[:id])
    @goal.attributes = params[:goal]
    if @goal.save
      redirect_to :goals
    else
      render :edit
    end
  end

  def destroy
    @goal = current_user.goals.find_by_id(params[:id])
    @goal.destroy
  end
  
  def ask_share
    @goal = current_user.goals.find_by_id
    @message = "I want to #{@goal.name} by #{@goal.deadline}. Show me your support at #{root_url}"
  end
  def share
    @goal = current_user.find_goal_by_id(params[:id])
    current_user.facebook_post(params[:message])
    redirect_to goal_path(@goal)
  end

end

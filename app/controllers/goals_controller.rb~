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
    @goal = current_user.goals.find_by_id(params[:id])
    @message = "I want to #{@goal.name} by #{@goal.deadline.strftime("%B %e, %Y")}. Give me your support at #{root_url}"
  end
  def share
    @goal = current_user.goals.find_by_id(params[:id])
    if s = session[:omniauth] && c = s["credentials"] && toekn = c["token"]
      @graph = Koala::Facebook::API.new(token)
      @graph.put_object("me", "feed", :message => params[:message]) 
    end
    redirect_to phone_goal_path(@goal)
  end

  def ask_phone
    @goal = current_user.goals.find_by_id(params[:id])
    @message = "Remember, you said you wanted to #{@goal.name}. How's that going?"
  end
  def phone
    require 'contact'
    current_user.update_attribute(:phone_number, params[:phone_number])
    Contact.sms(current_user.phone_number, params[:message])
    redirect_to :goals
  end


end

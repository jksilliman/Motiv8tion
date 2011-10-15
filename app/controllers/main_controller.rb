class MainController < ApplicationController
  def index
    if current_user
      redirect_to :goals
    end
  end

end 

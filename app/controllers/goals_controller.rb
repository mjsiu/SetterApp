class GoalsController < ApplicationController
  before_action :redirect_login

  def new
    @goal = Goal.new
  end

  def create

    @goal = Goal.new(goal_params)
    @goal.user_id = current_user.id

    if @goal.save
      redirect_to user_url(current_user)
    else
      flash.now[:errors] = @goal.errors.full_messages
      render :new
    end
  end

  def show
    @goal = Goal.find(params[:id])
  end

  def updateStatus
    @goal = Goal.find(params[:id])
    @goal.completed = true
    @goal.save!

    redirect_to goal_url(@goal)
  end

  private

  def goal_params
    params.require(:goal).permit(:title, :body, :visiblity)
  end
end

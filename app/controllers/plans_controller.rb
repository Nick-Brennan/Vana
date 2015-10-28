class PlansController < ApplicationController
  def create
  	plan = Plan.create(plan_params)
  	redirect_to "/plans/#{plan.id}"
  end

  def show
    puts "finding the plan..."
    @user = current_user
    @plan = Plan.find(params[:id])
    puts "Here's the plan: " + @plan.to_s
  end

  private
  def plan_params
  	params.require(:plan).permit(:user_id, :distance, :monmap, :monpace, :monurl, :tuemap, :tuepace, :tueurl, :wedmap, :wedpace, :wedurl, :thumap, :thupace, :tueurl, :frimap, :fripace, :friurl, :satmap, :satpace, :saturl, :sunmap, :sunpace, :sunurl)
  end


end

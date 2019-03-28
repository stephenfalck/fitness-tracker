class Activity::BuildController < ApplicationController
  include Wicked::Wizard

  steps :category, :datetime

  #have to deactivate cross site reference forgery
  protect_from_forgery with: :null_session

  def show
    find_categories
    @activity = Activity.find(params[:activity_id])
    render_wizard
  end

  def update
    find_categories
    
    respond_to do |format|
      format.html do
         @activity = Activity.find(params[:activity_id])
         @activity.status = step.to_s
        @activity.status = 'active' if step == steps.last
        #params[:activity][:status] = step.to_s
        #params[:activity][:status] = 'active' if step == steps.last
        #@activity.update_attributes(params[:activity])
        #@activity.update_attributes(activity_params)
        render_wizard @activity
      end
      
      format.text do
        @activity = Activity.find(params[:activity_id])
        @activity.status = step.to_s
        @activity.status = 'active' if step == steps.last
        #params[:activity][:status] = step.to_s
        #params[:activity][:status] = 'active' if step == steps.last
        #@activity.update_attributes(params[:activity])
        @activity.update_attributes(activity_params)
        render_wizard @activity
      end
    end
  end

  def finish_wizard_path
    activities_path
  end


  private
  def activity_params
      params.require(:activity).permit(:user_id, :date, :duration, :category_id, :status, :activity_id, :id)
  end
end

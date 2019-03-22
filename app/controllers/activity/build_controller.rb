class Activity::BuildController < ApplicationController
  include Wicked::Wizard
  steps *Activity.form_steps

  #have to deactivate cross site reference forgery
  protect_from_forgery with: :null_session

  #wrap_parameters format: [:json]

  def show
    find_categories
    @activity = Activity.find(params[:activity_id])
    render_wizard
  end

  def update
    find_categories
    #@activity = Activity.find(params[:activity_id])

    respond_to do |format|
      format.html # index.html.erb 
      format.json do
        #params[:user_id] = current_user
        #puts params
        @activity = Activity.find(params[:activity_id])
        @activity.update_attributes(activity_params(step))
      end
    end

    render_wizard @activity
  end

  private

  def activity_params(step)
  	permitted_attributes = case step
  	  when "category"
  	    [:category]
  	  when "datetime"
  	    [:date, :duration]
  	  end

    #params.require(:activity).permit(permitted_attributes).merge(form_step: step)
    params.permit(permitted_attributes).merge(form_step: step)
  end
end

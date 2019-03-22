class ActivitiesController < ApplicationController
    before_action :require_author, only: [:edit, :update, :destroy]

    def index
        if user_signed_in?
            @activities = Activity.all
        else
            redirect_to login_path
        end
    end

    def show
        @activity = Activity.find(params[:id])
    end

    def new
        @activity = Activity.new
        find_categories
    end

    def edit
        @activity = Activity.find(params[:id])
    end

    def create
        @activity = Activity.new
        #@activity.user = current_user
        @activity.save(validate: false)
        redirect_to activity_build_path(@activity, Activity.form_steps.first)

        #@activity = Activity.new(activity_params)
        #@activity.user = current_user
#
#
        #if @activity.save
        #    redirect_to @activity
        #else
        #    render 'new'
        #end
    end

    def update
        @activity = Activity.find(params[:id])

        if @activity.update(activity_params)
            redirect_to @activity
        else
            render 'edit'
        end
    end

    def destroy
        @activity = Activity.find(params[:id])
        @activity.destroy

        redirect_to activities_path
    end

    private
        def activity_params
            params.require(:activity).permit(:exercise, :date, :duration, :category)
        end

        def require_author
            @activity = Activity.find(params[:id])
            redirect_to(login_path) unless @activity.user == current_user
        end
end

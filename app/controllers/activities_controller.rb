class ActivitiesController < ApplicationController
    before_action :require_author, only: [:edit, :update, :destroy]

    #have to deactivate cross site reference forgery
    #protect_from_forgery with: :null_session

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
        @activity = Activity.new(activity_params)
        @activity.user_id = current_user.id
        @activity.save!

        if @activity.save
            redirect_to activities_path
        else
            render 'new'
        end
    end

    def update
        @activity = Activity.find(params[:id])

        if @activity.update(activity_params)
            redirect_to activities_path
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
            params.require(:activity).permit(:date, :duration, :category_id).merge(user_id: current_user.id)
        end

        def require_author
            @activity = Activity.find(params[:id])
            redirect_to(login_path) unless @activity.user == current_user
        end
end

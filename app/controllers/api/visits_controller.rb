module Api
  class VisitsController < ApplicationController

    def create
      @visited = User.find(params[:user_id])
      @visit = current_user.visited.create(visited: @visited.id) unless current_user == @visited
      redirect_to user_url(User.find(@visited.id))
    end

    def index
      @visitors = current_user.visitors.distinct
      @visitors = current_user.visitors.distinct
      #render json: @visitors
      render :index
    end

  end
end

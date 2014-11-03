module Api
  class MessagesController < ApiController

    def show
      @message = Message.find(params[:id])
      if @message
        render json: @message
      else
        render json: @message.errors.full_messages, status: :unprocessable_entity
      end
    end

    def conversation
      @user = User.find(params[:user_id])
      @messages = Message.where(from: [@user.id, current_user.id], to: [@user.id, current_user.id])
      render json: @messages
    end

  end
end
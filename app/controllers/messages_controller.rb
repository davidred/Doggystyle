class MessagesController < ApplicationController

  def new
    @message = current_user.sent_messages.new
    @user = User.find(params[:user_id])
    render :new
  end

  def create
    @message = current_user.sent_messages.new(message_params)
    @message.to = params[:user_id]
    if @message.save
      flash[:notice] = ["Message successfully created"]
      redirect_to message_url(@message)
    else
      flash[:errors] = @message.errors.full_messages
      render :new
    end
  end

  def destroy
    @message = Message.find(params[:id])
    @message.destroy
    redirect_to messages_url
  end

  def index
    @messages = current_user.received_messages
    render :index
  end

  def conversation
    @user = User.find(params[:user_id])
    @messages = Message.where(from: [@user.id, current_user.id], to: [@user.id, current_user.id])
    render :conversation, layout: 'signed_in'
  end

  def show
    @message = Message.find(params[:id])
    render :show
  end

  private

  def message_params
    params.require(:message).permit(:body)
  end


end

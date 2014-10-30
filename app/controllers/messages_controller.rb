class MessagesController < ApplicationController

  def new
    @message = current_user.sent_messages.new
    render :new
  end

  def create
    @message = current_user.sent_messages.new(message_params)
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

  def show
    @message = Message.find(params[:id])
    render :show
  end

  private

  def message_params
    params.require(:message).permit(:body)
  end


end

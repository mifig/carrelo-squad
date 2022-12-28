class MessagesController < ApplicationController
  def index
    @messages = Message.all.order(:created_at)
  end

  def create
    @message = Message.new(message_params)

    if @message.save
      redirect_to about_path, notice: "Mensagem enviada!"
    else
      render "pages/about", status: :unprocessable_entity
    end
  end

  def destroy
    @message = Message.find(params[:id])
    @message.destroy

    redirect_to messages_path
  end

  private

  def message_params
    params.require(:message).permit(:email, :subject, :content)
  end
end

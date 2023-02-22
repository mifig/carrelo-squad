class MessagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:create]
  before_action :set_message, only: [:destroy, :message_read, :message_unread]

  def index
    @messages = Message.all.order(created_at: :desc)
  end

  def create
    @message = Message.new(message_params)
    @message.save

    respond_to do |format|
      format.html { redirect_to about_path, notice: "Message sent!" }
      format.text { render partial: "shared/message_form", locals: {message: @message}, formats: [:html] }
    end
  end

  def destroy
    @message.destroy

    redirect_to messages_path, notice: "Mensagem apagada."
  end

  def message_read
    unless @message.read
      @message.read = true

      if @message.save
        respond_to do |format|
          format.html
          format.json { render json: { message: "Mensagem lida!", messageId: @message.id }.to_json }
        end
      end
    else
      respond_to do |format|
        format.html
        format.json { render json: { message: "Mensagem já lida!", messageId: @message.id }.to_json }
      end
    end
  end

  def message_unread
    if @message.read
      @message.read = false

      if @message.save
        respond_to do |format|
          format.html
          format.json { render json: { message: "Mensagem marcada como não lida!", messageId: @message.id }.to_json }
        end
      end
    else
      respond_to do |format|
        format.html
        format.json { render json: { message: "Mensagem não lida!", messageId: @message.id }.to_json }
      end
    end
  end

  private
  
  def set_message
    @message = Message.find(params[:id])  
  end

  def message_params
    params.require(:message).permit(:email, :subject, :content)
  end
end

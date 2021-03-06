class MessagesController < ApplicationController
  def new
    @message = Message.new
  end
  def create
    @message = Message.new(message_params)
    if @message.valid?
      MessageMailer.message_me(@message).deliver_now
	  flash[:notice] = 'Mensaje Enviado'
      redirect_to new_message_path
    else
      flash[:notice] = 'Error, complete correctamente todos los campos'
      redirect_to new_message_path
	end
  end

  private

  def message_params
    params.require(:message).permit(:name, :email, :subject, :content)
  end

end

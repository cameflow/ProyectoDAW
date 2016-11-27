class SendersController < ApplicationController
  def new
    @sender = Sender.new
  end

  def create
    @sender = Sender.new(sender_params)
    if @sender.save
      flash[:success] = "Your account has been created succesfully"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
    @sender = current_user
  end

  private
    def sender_params
      params.require(:sender).permit(:name, :last_name, :mail, :password)
    end
end

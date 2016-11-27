class LoginsController < ApplicationController
  def new

  end

  def create
    sender = Sender.find_by(mail: params[:mail])
    if sender && sender.authenticate(params[:password])
      session[:sender_id] = sender.id
      flash[:success] = "you are logged in"
      redirect_to root_path
    else
      flash.now[:danger] = "Your password don't match"
      render 'new'
    end
  end

  def destroy
    session[:sender_id] = nil
    flash[:success] = "you have logged out"
    redirect_to root_path
  end
end

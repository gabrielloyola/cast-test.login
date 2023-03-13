class SessionController < ApplicationController
  skip_before_action :verify_authenticity_token

  def new; end

  def create
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id

      redirect_to cast_path, notice: 'Logado com sucesso.'
    else
      flash.alert = 'Usuário e/ou senha incorretos. Tente novamente.'

      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash.notice = 'Deslogado com sucesso.'

    redirect_to action: 'new'
  end

  private

  def user
    @user ||= User.find_by(username: params[:session][:username])
  end
end

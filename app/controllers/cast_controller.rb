class CastController < ApplicationController
  def index
    return redirect_to login_path, alert: 'Usuário não logado.' if session[:user_id].nil?

    @user = User.find(session[:user_id])
  end
end

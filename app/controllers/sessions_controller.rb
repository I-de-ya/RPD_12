# coding: utf-8
class SessionsController < ApplicationController
  def new
  	@title = "Войти"
  end

  def create
  	user = User.authenticate(params[:session][:email],params[:session][:password])
  	if user.nil?
  		flash.now[:error]="Неправильная комбинация имени и пароля."
  		@title = "Войти"
  		render 'new'
  	else
  		sign_in user
  		redirect_to :controller => 'posts', :action => 'news_page'
  	end
  end

  def destroy
  	sign_out
  	redirect_to root_path
  end
end

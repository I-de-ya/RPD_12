# coding: utf-8
class UsersController < ApplicationController
	
	def new
		@user = User.new
		@title = t(:registration_page)
	end

	def create
    	@user = User.new(params[:user])
    	
    	if @user.save
    		sign_in @user
    		flash[:success] = "Приветствуем, Гость!"
      		redirect_to :controller => 'posts', :action => 'news_page'
    	else
      		@title = "Зарегистрироваться"
      		render 'new'
    	end
  	end

end

# coding: utf-8
class UsersController < ApplicationController
	
	def new
		@user = User.new
		@title = "Зарегистрироваться"
	end

	def create
    	@user = User.new(params[:user])
    	
    	if @user.save
      		redirect_to @user
    	else
      		@title = "Зарегистрироваться"
      		render 'new'
    	end
  	end

	def sign_in
		@title = "Войти"
	end
end

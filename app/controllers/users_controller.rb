# coding: utf-8
class UsersController < ApplicationController
  before_filter :authenticate, :only => [:index]
	before_filter :admin_user, :only => [:index]
  def index
    @title = "Пользователи"
    @users = User.all
  end

	def new
		@user = User.new
		@title = t(:signup_page)
	end

	def create
    	@user = User.new(params[:user])
    	
    	if @user.save
    		sign_in @user
      	redirect_to :controller => 'speeches', :action => 'new_entry_form'
    	else
      		@title = "Зарегистрироваться"
      		render 'new'
    	end
  	end
end

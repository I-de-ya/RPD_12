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
      redirect_to :controller => 'speeches', :action => 'new'
    else
      @title = t(:signup_page)
      render 'new'
    end
  end
 
  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.toggle!(:admin)
    if @user.update_attributes(params[:user])
      redirect_to @user, :notice => 'Прaва пользователя были успешно обновлены.'
    else
      render :action => "edit"
    end
  end

  def delete
    @speech = User.find(params[:id])
  end

  def destroy
    @speech = User.find(params[:id]).destroy
    flash[:success] = "Пользователь был удален."
    redirect_to users_path
  end
end

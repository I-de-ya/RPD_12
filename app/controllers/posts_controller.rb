# coding: utf-8
class PostsController < ApplicationController
  before_filter :authenticate, :except => [:news_page, :show]
  before_filter :admin_user, :except => [:news_page, :show]

  def index
  	@title = t(:news_management_page)
    @posts = Post.all
  end
  
  def news_page
  	@title = t(:main_page)
    @posts = Post.all
  end
  
  def new
  	@title = "Создание новости"
    @post = Post.new
  end

  def create
  	@post = Post.new(params[:post])
  	if @post.save
  		redirect_to @post, :notice => 'Новость была успешно создана.'
  	else
  		render :action => "new"
  	end
  end

  def show
    @post = Post.find(params[:id])
    
    if current_user.nil?
      @title = @post.title
    else
      @title = @post.title
      @title = "Новость" if current_user.admin?
    end
  end

  def edit
  	@title = "Редактирование новости"
    @post = Post.find(params[:id])
  end

  def update
  	@post = Post.find(params[:id])
  	if @post.update_attributes(params[:post])
  		redirect_to @post, :notice => 'Новость была успешно обновлена.'
  	else
  		render :action => "edit"
  	end
  end

 def delete
  	@post = Post.find(params[:id])
  end

  def destroy
  	@post = Post.find(params[:id]).destroy
  	flash[:success] = "Новость была удалена."
  	redirect_to posts_path
  end
end

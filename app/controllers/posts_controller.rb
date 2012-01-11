# coding: utf-8
class PostsController < ApplicationController

  def index
  	@posts = Post.all
  end
  
  def news_page
  	@posts = Post.all
  end
  
  def new
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
  end

  def edit
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
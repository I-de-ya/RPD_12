# coding: utf-8
class SpeechesController < ApplicationController
  before_filter :authenticate
  before_filter :correct_user, :only => [:edit, :update, :show]
  before_filter :admin_user, :only => [:new, :create, :index, :delete, :destroy]

  def index
  	@title = t(:speeches_management_page)
    @speeches = Speech.all
  end
  
  def new
  	@speech = Speech.new
  end

	def new_entry_form # Создание новой формы заявки
		@title = t(:registration_page)
    @speech = Speech.new
    @themes = Theme.all
	end

  def create
  	@speech = Speech.new(params[:speech])
  	if @speech.save
  		redirect_to @speech, :notice => 'Доклад был успешно создан.'
  	else
  		render :action => "new"
  	end
  end

	def create_entry_form # Создание новой заявки
  	@title = t(:registration_page)
    @speech = Speech.new(params[:speech])
    @speech.user_id = current_user.id
  	if @speech.save
      flash[:notice] = 'Ваша заявка принята.'
  		redirect_to :controller => :pages, :action => :thesis_rules
  	else
  		render :action => "new_entry_form"
  	end
  end

  def show
  	@legend_title = current_user.admin? ? "Текущий доклад" : "Ваша заявка"
    @speech = Speech.find(params[:id])
  end

  def edit
  	@title = current_user.admin? ? "Редактирование доклада" : "Редактирование заявки"
    @speech = Speech.find(params[:id])
  end

  def update
  	@speech = Speech.find(params[:id])
  	if @speech.update_attributes(params[:speech])
  		redirect_to @speech, :notice => current_user.admin? ? 'Доклад был успешно обновлен.' : 'Заявка была успешно обновлена'
  	else
  		render :action => "edit"
  	end
  end

 def delete
  	@speech = Speech.find(params[:id])
  end

  def destroy
  	@speech = Speech.find(params[:id]).destroy
  	flash[:success] = "Доклад был удален."
  	redirect_to speeches_path
  end

  private
    def correct_user
      @user = Speech.find(params[:id]).user
      redirect_to(root_path) unless (current_user?(@user) || current_user.admin?)
    end
end

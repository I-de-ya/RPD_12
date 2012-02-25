# coding: utf-8
class SpeechesController < ApplicationController
  before_filter :authenticate
  before_filter :correct_user, :only => [:edit, :update, :show]
  before_filter :admin_user, :only => [:index, :delete, :destroy]
  before_filter :has_speech, :only => [:new]

  def index
  	@title = t(:speeches_management_page)
    @speeches = Speech.all
  end
  
  def new
  	@title = t(:registration_page) unless current_user.admin?
    @speech = Speech.new
    @themes = Theme.all
  end
=begin
	def new_entry_form # Создание новой формы заявки
		@title = t(:registration_page)
    @speech = Speech.new
    @themes = Theme.all
	end
=end
  def create
    @speech = Speech.new(params[:speech])
    @themes = Theme.all
       
    unless current_user.admin?
      @title = t(:registration_page)
      @speech.user_id = current_user.id 
    end
  	
    if @speech.save
  		redirect_to @speech, :notice => current_user.admin? ? 'Доклад был успешно создан.' : 'Ваша заявка принята.'
  	else
  		render "new"
  	end
  end

=begin
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
=end


  def show
  	@legend_title = current_user.admin? ? "Текущий доклад" : "Ваша заявка"
    @speech = Speech.find(params[:id])
  end

  def edit
  	@title = current_user.admin? ? "Редактирование доклада" : "Редактирование заявки"
    @speech = Speech.find(params[:id])
    @themes = Theme.all
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

    def has_speech
      redirect_to current_user.speech unless current_user.speech == nil
    end
end

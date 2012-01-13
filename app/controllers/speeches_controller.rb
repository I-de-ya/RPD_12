# coding: utf-8
class SpeechesController < ApplicationController
  
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
  	if @speech.save
      flash[:notice] = 'Ваша заявка принята.'
  		redirect_to :controller => :pages, :action => :thesis_rules
  	else
  		render :action => "new_entry_form"
  	end
  end

	def congrats
	end

  def show
  	@title = "Текущий доклад"
    @speech = Speech.find(params[:id])
  end

  def edit
  	@title = "Редактирование доклада"
    @speech = Speech.find(params[:id])
  end

  def update
  	@speech = Speech.find(params[:id])
  	if @speech.update_attributes(params[:post])
  		redirect_to @speech, :notice => 'Доклад был успешно обновлен.'
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

end

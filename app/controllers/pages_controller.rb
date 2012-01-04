# coding: utf-8
class PagesController < ApplicationController
  def home
  	@title = "Главная страница"
  end

  def about
 		@title = "О конференции"
  end

  def org_committee
  	@title = "Оргкомитет"
  end

  def thesis_rules
  	@title = "Правила оформления тезисов"
  end

  def contacts
  	@title = "Контакты"
  end

  def registration
  	@title = "Регистрация участников"
  end

  def tasks
  	@title = "Заботы разработчика"
  end	
end

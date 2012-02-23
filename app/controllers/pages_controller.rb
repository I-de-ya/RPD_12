# coding: utf-8
class PagesController < ApplicationController
  def home
  	@title = t(:main_page)
  end

  def about
 		@title = t(:about_page)
    @themes = Theme.all
  end

  def org_committee
  	@title = t(:org_commitee_page)
  end

  def thesis_rules
  	@title = t(:thesis_rules_page)
  end

  def contacts
  	@title = t(:contacts_page)
  end

  def signup
  	@title = t(:signup_page)
  end

  def tasks
  	@title = "Заботы разработчика"
  end

  def dates
    @title = "ВАЖНЫЕ ДАТЫ"
  end

  def payment
    @title = "ОПЛАТА УЧАСТИЯ"
  end

  def download_rules
    send_file "#{Rails.root}/public/Правила оформления текстов докладов.doc"
  end

  def download_sample
    send_file "#{Rails.root}/public/Пример оформления доклада.doc"
  end

end

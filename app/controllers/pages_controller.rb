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

  def dates
    @title = t(:dates_page)
  end

  def payment
    @title = t(:payment_page)
  end

  def schedule
    @title = t(:schedule_page)
  end

  def download_rules
    send_file "#{Rails.root}/public/paper_execution.doc"
  end

  def download_rules_en
    send_file "#{Rails.root}/public/paper_execution_en.doc"
  end

  def download_sample
    send_file "#{Rails.root}/public/morozov_1.doc"
  end

end

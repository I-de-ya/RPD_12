# coding: utf-8
class PagesController < ApplicationController
  def home
  	@title = t(:main_page)
  end

  def about
 		@title = t(:about_page)
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
end

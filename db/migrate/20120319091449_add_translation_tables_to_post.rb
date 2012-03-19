class AddTranslationTablesToPost < ActiveRecord::Migration
  def up
  	Post.create_translation_table! :title => :string, :body => :text
  end

  def down
  	Post.drop_translation_table!
  end
end

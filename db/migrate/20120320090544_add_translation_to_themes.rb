class AddTranslationToThemes < ActiveRecord::Migration
  def up
  	Theme.create_translation_table! :title => :string
  end

  def down
  	Theme.drop_translation_table!
  end
end

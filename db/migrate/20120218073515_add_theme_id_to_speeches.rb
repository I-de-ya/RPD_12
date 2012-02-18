class AddThemeIdToSpeeches < ActiveRecord::Migration
  def change
    add_column :speeches, :theme_id, :integer
    add_column :speeches, :is_plenar, :boolean, :default => false
  end
end
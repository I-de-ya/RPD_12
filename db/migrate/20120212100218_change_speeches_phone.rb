class ChangeSpeechesPhone < ActiveRecord::Migration
  def up
  	change_column :speeches, :phone, :string
  end

  def down
  end
end

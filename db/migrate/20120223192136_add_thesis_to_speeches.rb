class AddThesisToSpeeches < ActiveRecord::Migration
  def change
    add_column :speeches, :thesis, :string
  end
end

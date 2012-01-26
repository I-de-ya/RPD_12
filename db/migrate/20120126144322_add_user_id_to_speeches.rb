class AddUserIdToSpeeches < ActiveRecord::Migration
  def change
    add_column :speeches, :user_id, :integer
  end
end

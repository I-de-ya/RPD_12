class CreateSpeeches < ActiveRecord::Migration
  def change
    create_table :speeches do |t|
      t.string :organization
      t.string :author_name
      t.string :title
      t.integer :phone
      t.string :email
      t.boolean :delivery_subscription

      t.timestamps
    end
  end
end

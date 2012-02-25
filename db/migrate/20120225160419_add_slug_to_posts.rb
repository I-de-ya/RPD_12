class AddSlugToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :slug_en, :string
    add_column :posts, :slug_ru, :string
    add_index :posts, :slug_en
    add_index :posts, :slug_ru
  end
end

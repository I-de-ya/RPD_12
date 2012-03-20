class RemoveSlugsFromPosts < ActiveRecord::Migration
  def up
    remove_column :posts, :slug_en
    remove_column :posts, :slug_ru
  end

  def down
    add_column :posts, :slug_ru, :string
    add_column :posts, :slug_en, :string
  end
end

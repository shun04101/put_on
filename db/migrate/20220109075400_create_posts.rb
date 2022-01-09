class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.integer :site_id
      t.string :title
      t.text :comment
      t.integer :image_id
      t.string :tag

      t.timestamps
    end
  end
end

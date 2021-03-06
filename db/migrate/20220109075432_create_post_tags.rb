class CreatePostTags < ActiveRecord::Migration[5.2]
  def change
    create_table :post_tags do |t|
      
      t.references :post, foreign_key: true
      t.integer :tag_id
      
      t.timestamps
    end
    # 同じタグを２回保存できないようにする
    add_index :post_tags, [:post_id, :tag_id], unique: true
  end
end

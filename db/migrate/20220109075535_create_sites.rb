class CreateSites < ActiveRecord::Migration[5.2]
  def change
    create_table :sites do |t|
      t.integer :post_id
      t.text :link
      t.integer :info

      t.timestamps
    end
  end
end

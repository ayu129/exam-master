class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :title
      t.text :body
      t.integer :category_id
      t.timestamps null: false
    end
  end
end
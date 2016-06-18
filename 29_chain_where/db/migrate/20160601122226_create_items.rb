class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.float :price
      t.string :name
      t.boolean :real
      t.float :weight
      t.string :description

      t.timestamps null: false # add 2 columns: :created_at, :updated_at
    end
    add_index :items, :price
    add_index :items, :name
  end
end

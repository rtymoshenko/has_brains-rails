class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body
      t.integer :user_id
      t.integer :commentable_id # item_id раньше было
      t.string :commentable_type # name of model Item, BlogPost
      t.timestamps null: false
    end
  end
end

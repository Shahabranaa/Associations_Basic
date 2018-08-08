class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.text :body
      t.integer :commentable_id
      t.text :commentable_type

      t.timestamps
    end
    add_index :comments, :commentable_id
  end
end

class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.references :user, foreign_key: true
      t.references :illustrated_book, foreign_key: true

      t.timestamps
    end

    add_index :likes, [:user_id, :illustrated_book_id], unique: true
  end
end

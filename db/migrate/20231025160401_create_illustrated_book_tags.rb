class CreateIllustratedBookTags < ActiveRecord::Migration[7.0]
  def change
    create_table :illustrated_book_tags do |t|
      t.references :illustrated_book, foreign_key: true
      t.references :tag, foreign_key: true
      t.timestamps
    end
  end
end

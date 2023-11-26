class CreateIllustratedBookFieldDesigns < ActiveRecord::Migration[7.0]
  def change
    create_table :illustrated_book_field_designs do |t|
      t.text :content
      t.references :illustrated_book, null: false, foreign_key: true
      t.references :fielg_design, null: false, foreign_key: true

      t.timestamps
    end
  end
end

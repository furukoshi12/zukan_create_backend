class CreateIllustratedBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :illustrated_books do |t|
      t.string :title, null: false
      t.boolean :show_google_map, default: false
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

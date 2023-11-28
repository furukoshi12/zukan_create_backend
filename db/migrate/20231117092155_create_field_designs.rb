class CreateFieldDesigns < ActiveRecord::Migration[7.0]
  def change
    create_table :field_designs do |t|
      t.integer :label
      t.integer :background_color
      t.integer :color
      t.integer :border_color
      t.integer :border_style
      t.integer :border_radius
      t.integer :font_family
      t.integer :font_size

      t.timestamps
    end
  end
end

class CreateTemplateFieldDesigns < ActiveRecord::Migration[7.0]
  def change
    create_table :template_field_designs do |t|
      t.references :template, null: false, foreign_key: true
      t.references :field_design, null: false, foreign_key: true
      t.integer :x_position
      t.integer :y_posisiton

      t.timestamps
    end
  end
end

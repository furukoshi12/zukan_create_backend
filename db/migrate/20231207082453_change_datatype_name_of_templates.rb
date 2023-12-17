class ChangeDatatypeNameOfTemplates < ActiveRecord::Migration[7.0]
  def change
    change_column :templates, :name, :string
  end
end

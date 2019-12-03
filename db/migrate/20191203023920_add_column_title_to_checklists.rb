class AddColumnTitleToChecklists < ActiveRecord::Migration[6.0]
  def change
    add_column :checklists, :name, :string
  end
end

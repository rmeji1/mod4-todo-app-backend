class CreateChecklists < ActiveRecord::Migration[6.0]
  def change
    create_table :checklists do |t|
      t.belongs_to :task, null: false, foreign_key: true

      t.timestamps
    end
  end
end

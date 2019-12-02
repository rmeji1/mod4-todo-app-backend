class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.belongs_to :checklist, null: false, foreign_key: true
      t.string :test
      t.boolean :is_completed, default: false 

      t.timestamps
    end
  end
end

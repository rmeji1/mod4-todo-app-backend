class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.string :name
      t.string :description
      t.datetime :deadline
      t.boolean :is_completed, default: false 
      t.string :priority
      t.boolean :is_deleted, default: false

      t.timestamps
    end
  end
end

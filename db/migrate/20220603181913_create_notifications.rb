class CreateNotifications < ActiveRecord::Migration[6.1]
  def change
    create_table :notifications do |t|
      t.integer :event, null:false
      t.boolean :checked, default: false, null: false
      t.references :favorite, null: true, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end

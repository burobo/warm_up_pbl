class CreateOriginators < ActiveRecord::Migration[6.1]
  def change
    create_table :originators do |t|
      t.string :name, null: false
      t.string :email, null: false

      t.timestamps
    end
    add_index :originators, :email, unique: true
  end
end

class CreateImplementers < ActiveRecord::Migration[6.1]
  def change
    create_table :implementers do |t|
      t.string :name, null: false
      t.string :email, null: false

      t.timestamps
    end
    add_index :implementers, :email, unique: true
  end
end

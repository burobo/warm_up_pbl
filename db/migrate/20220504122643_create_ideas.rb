class CreateIdeas < ActiveRecord::Migration[6.1]
  def change
    create_table :ideas do |t|
      t.text :title
      t.text :outline
      t.text :detail
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

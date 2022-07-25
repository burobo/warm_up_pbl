class AddCommentToNotifications < ActiveRecord::Migration[6.1]
  def change
    change_table :notifications do |t|
      t.references :comment, null: true, foreign_key: true
    end
  end
end

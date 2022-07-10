class AddEmojiToIdeas < ActiveRecord::Migration[6.1]
  def change
    add_column :ideas, :emoji, :string
  end
end

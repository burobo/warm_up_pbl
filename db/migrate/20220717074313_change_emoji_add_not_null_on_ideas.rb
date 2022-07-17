class ChangeEmojiAddNotNullOnIdeas < ActiveRecord::Migration[6.1]
  def change
    change_column_null :ideas, :emoji, :false
  end
end

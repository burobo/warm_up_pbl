class AddStatusToIdeas < ActiveRecord::Migration[6.1]
  def change
    add_column :ideas, :status, :integer
  end
end

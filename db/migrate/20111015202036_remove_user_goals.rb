class RemoveUserGoals < ActiveRecord::Migration
  def up
    drop_table :user_goals
    add_column :goals, :user_id, :integer
  end

  def down
  end
end

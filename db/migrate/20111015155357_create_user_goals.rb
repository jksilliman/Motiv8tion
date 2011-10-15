class CreateUserGoals < ActiveRecord::Migration
  def change
    create_table :user_goals do |t|
      t.integer :user_id
      t.integer :goal_id
      t.timestamps
    end
    add_index :user_goals, [:user_id, :goal_id]
  end
end

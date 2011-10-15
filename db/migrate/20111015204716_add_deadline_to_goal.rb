class AddDeadlineToGoal < ActiveRecord::Migration
  def change
    add_column :goals, :deadline, :datetime
  end
end

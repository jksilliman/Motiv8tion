class AddReasonToGoals < ActiveRecord::Migration
  def change
    add_column :goals, :reason, :text
  end
end

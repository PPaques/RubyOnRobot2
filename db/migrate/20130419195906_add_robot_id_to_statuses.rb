class AddRobotIdToStatuses < ActiveRecord::Migration
  def change
    add_column :statuses, :robot_id, :integer
  end
end

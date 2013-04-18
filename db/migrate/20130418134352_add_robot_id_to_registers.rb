class AddRobotIdToRegisters < ActiveRecord::Migration
  def change
    add_column :registers, :robot_id, :integer
  end
end

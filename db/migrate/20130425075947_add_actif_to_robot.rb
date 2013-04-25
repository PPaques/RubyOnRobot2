class AddActifToRobot < ActiveRecord::Migration
  def change
    add_column :robots, :actif, :boolean
  end
end

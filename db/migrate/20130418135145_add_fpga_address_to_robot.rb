class AddFpgaAddressToRobot < ActiveRecord::Migration
  def change
    add_column :robots, :fpga_adress, :string
  end
end

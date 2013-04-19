class AddStatusIdToStatusGpio < ActiveRecord::Migration
  def change
    add_column :status_gpios, :status_id, :integer
    add_column :status_registers, :status_id, :integer
  end
end

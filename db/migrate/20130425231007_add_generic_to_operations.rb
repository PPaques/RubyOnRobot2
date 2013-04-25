class AddGenericToOperations < ActiveRecord::Migration
  def change
    add_column :operations, :operation_generic_id, :integer
  end
end

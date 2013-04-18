class Register < ActiveRecord::Base
  attr_accessible :address, :description, :last_value, :name, :value, :robot_id
end

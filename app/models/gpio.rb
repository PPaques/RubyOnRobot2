class Gpio < ActiveRecord::Base
  attr_accessible :description, :direction, :name, :pin, :robot_id
end

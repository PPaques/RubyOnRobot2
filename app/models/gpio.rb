class Gpio < ActiveRecord::Base
  attr_accessible  :robot, :name, :description, :direction, :pin, :value, :default_value

  belongs_to :robot
  belongs_to :status_gpio

  validates :robot, :name, :description, :direction, :pin, :default_value,  :presence => true
end

class Gpio < ActiveRecord::Base
  attr_accessible  :robot, :name, :description, :direction, :pin, :value, :default_value

  has_many   :status_gpio

  belongs_to :robot


  validates :robot, :name, :description, :direction, :pin, :default_value,  :presence => true
  validates :name, :uniqueness => true
end

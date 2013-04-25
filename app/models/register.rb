class Register < ActiveRecord::Base
  attr_accessible :robot, :name, :address, :description, :value, :default_value, :last_value

  has_many   :status_register

  belongs_to :robot

  validates :robot, :name, :address, :description, :default_value, :presence => true
  validates :name, :uniqueness => true

  def set_value new_value
    new_value ||= default_value
    robot.write_register(address, new_value)
  end

end

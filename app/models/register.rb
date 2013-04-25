class Register < ActiveRecord::Base
  attr_accessible :robot, :name, :adress, :description, :value, :default_value, :last_value

  has_many   :status_register, :dependent => :delete_all

  belongs_to :robot

  validates :robot, :name, :adress, :description, :default_value, :presence => true
  validates :name, :uniqueness => true

  def set_value new_value
    new_value ||= default_value
    robot.write_register(adress, new_value)
  end

end

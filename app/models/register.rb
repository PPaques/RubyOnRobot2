class Register < ActiveRecord::Base
  attr_accessible :robot, :name, :adress, :description, :value, :default_value, :last_value

  has_many   :status_register, :dependent => :delete_all

  belongs_to :robot

  validates :robot, :name, :adress, :description, :default_value, :presence => true
  validates :name, :uniqueness => true

  def set_value new_value
    new_value ||= default_value
    self.value = new_value

    self.value = `i2cset -y 1 #{robot.adress} #{adress} #{new_value.upcase}`
    self.value.save
  end

  def self.value= value
    self.value = value.upcase
  end

  def read
    self.value = `i2cget -y 1 #{robot.adress} #{adress}`.delete("\n")
    self.save
  end
end

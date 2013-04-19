class StatusGpio < ActiveRecord::Base
  attr_accessible :gpio_id, :value

  belongs_to  :gpio
  belongs_to  :status

  validates :gpio,:value, :presence => true

  def name
    gpio.name
  end

  def direction
    gpio.direction
  end

  def pin
    gpio.pin
  end
end

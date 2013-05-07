class StatusGpio < ActiveRecord::Base
  attr_accessible :gpio_id, :value

  belongs_to  :gpio
  belongs_to  :status

  validates :gpio, :presence => true
  validates :value, inclusion: { in: [true, false], message: "can't be blank" }

  def name
    gpio.name
  end

  def direction
    gpio.direction
  end

  def pin
    gpio.pin
  end

  def set_value
    gpio.set_value value
  end

  def read
    gpio.read
  end

  def is_reached?
    if value = gpio.value
      true
    else
      false
    end
  end
end

class Gpio < ActiveRecord::Base
  attr_accessible  :robot, :name, :description, :direction, :pin, :value, :default_value

  has_many   :status_gpio, inverse_of: :gpio, :dependent => :delete_all

  belongs_to :robot

  validates :robot, :name, :description, :pin,  :presence => true
  validates :name, :uniqueness => true
  validates :direction, inclusion: { in: [true, false], message: "can't be blank" }

  def set_value new_value
    new_value ||= default_value
    if new_value
      self.on
    else
      self.off
    end
  end

  def is_input?
    self.direction
  end

  def direction_text
    if is_input?
      "Input"
    else
      "Output"
    end
  end

  def read
    if self.is_input?
      self.value = self.initialise_gpio.read if Rails.env.production?
      self.save
    end
  end

  def off
    unless is_input?
      self.initialise_gpio.off if Rails.env.production?
      self.value = false
      self.save
    end
  end

  def on
    unless is_input?
      self.initialise_gpio.on if Rails.env.production?
      self.value = true
      self.save
    end
  end

  def initialise_gpio
    if is_input?
      return GpioInterface.new(:pin => self.pin, :direction => :in)
    else
      return GpioInterface.new(:pin => self.pin, :direction => :out)
    end
  end
end

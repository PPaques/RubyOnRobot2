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

  def read
    self.value = self.initialise_gpio.read if Rails.env.production?
    self.save
  end

  def off
    if !direction
      self.initialise_gpio.off if Rails.env.production?
      self.value = false
      self.save
    end
  end

  def on
    if !direction
      self.initialise_gpio.on if Rails.env.production?
      self.value = true
      self.save
    end
  end

  private
  def initialise_gpio
    if direction
      return GpioInterface.new(:pin => :pin, :direction => :in)
    else
      return GpioInterface.new(:pin => :pin, :direction => :out)
    end
  end
end

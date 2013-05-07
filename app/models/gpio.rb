class Gpio < ActiveRecord::Base
  attr_accessible  :robot, :name, :description, :direction, :pin, :value, :default_value

  has_many   :status_gpio, inverse_of: :gpio, :dependent => :delete_all

  belongs_to :robot

  validates :robot, :name, :description, :direction, :pin, :default_value,  :presence => true
  validates :name, :uniqueness => true

  def after_initialize
    @my_cache = {}
    if Rails.env.production?
      @gpio = Gpio.new(:pin => :pin, :direction => :in)   if direction
      @gpio = Gpio.new(:pin => :pin, :direction => :out)  unless direction
    end
  end

  def set_value new_value
    new_value ||= default_value
    if new_value
      self.on
    else
      self.off
    end
  end

  def read
    self.value = @gpio_real.read if Rails.env.production?
    self.save
  end

  def off
    if direction
      @gpio_real.off if Rails.env.production?
      self.value = false
      self.save
    end
  end

  def on
    if direction
      @gpio_real.on if Rails.env.production?
      self.value = true
      self.save
    end
  end
end

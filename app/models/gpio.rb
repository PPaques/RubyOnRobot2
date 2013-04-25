class Gpio < ActiveRecord::Base
  attr_accessible  :robot, :name, :description, :direction, :pin, :value, :default_value

  has_many   :status_gpio, inverse_of: :gpio, :dependent => :delete_all

  belongs_to :robot

  validates :robot, :name, :description, :direction, :pin, :default_value,  :presence => true
  validates :name, :uniqueness => true

  @gpio_real = GpioInterface.new(:pin => :pin, :direction => self.direction_plein) if Rails.env.production?

  def set_value new_value
    new_value ||= default_value
    if new_value
      self.on
    else
      self.off
    end
  end

  def self.on
    value = @gpio_real.read if Rails.env.production?
    self.save
  end

  def self.off
    if direction
      @gpio_real.off if Rails.env.production?
      value = false
      self.save
    end
  end

  def self.read
    if direction
      @gpio_real.on if Rails.env.production?
      value = true
      self.save
    end
  end

  private

  def initialize_system
    @gpio_real = GpioInterface.new(:pin => :pin, :direction => self.direction_plein) if Rails.env.production?
  end

  def direction_plein
    if direction
      :in
    else
      :out
    end
  end

end

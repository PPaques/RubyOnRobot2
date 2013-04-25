class Robot < ActiveRecord::Base
  attr_accessible :name, :fpga_adress, :actif

  has_many :registers,          :inverse_of => :robot, :dependent => :delete_all
  has_many :gpios,              :inverse_of => :robot, :dependent => :delete_all
  has_many :statuses,           :inverse_of => :robot, :dependent => :delete_all
  has_many :tasks,              :inverse_of => :robot, :dependent => :delete_all
  has_many :operations,         :inverse_of => :robot, :dependent => :delete_all
  has_many :operation_generics, :inverse_of => :robot, :dependent => :delete_all
  has_many :working_operations, :inverse_of => :robot, :dependent => :delete_all

  validates :name,:fpga_adress, :actif, :presence => true


  def read_registers
    if Rails.env.production?

      require "i2c"

      # need the card to test that ...
      # Here goes the code for getting the data from all the I2C
      @i2c_port = "/dev/i2c-1" # todo : parameter
      @i2c_device = ::I2C.create("/dev/i2c-1")
      @adress = @fpga_adress

      registers.each do |register|
        register.last_value = register.value
        register.value = @i2c_device.read(eval(register))
        register.save
      end

    end
  end

  def write_register(adress, value)
    if Rails.env.production?

      require "i2c"

      # need the card to test that ...
      # Here goes the code for getting the data from all the I2C
      @i2c_port = "/dev/i2c-1" # todo : parameter
      @i2c_device = ::I2C.create("/dev/i2c-1")
      @i2c_device.write(eval(@fpga_adress), eval(adress), eval(value))
    end
  end

  def is_actif?
    actif
  end

  def has_current_operation?
    if current_operation.nil?
      false
    else
      true
    end
  end

  def current_operation
    working_operations.find_by_status("CURRENT")
  end

  def next_operation
    next_operation = working_operations.find_by_status("IDLE").first
  end
end

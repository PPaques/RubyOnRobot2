class I2c

    if Rails.env.production? and false
      # need the card to test that ...
      # Here goes the code for getting the data from all the I2C
      @i2c_port = "/dev/i2c-1"
      @i2c_device = ::I2C.create("/dev/i2c-1")
      @converter_address = 48
    end

end
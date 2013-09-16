class StatusRegister < ActiveRecord::Base
  attr_accessible :register_id, :value

  belongs_to  :register
  belongs_to  :status

  validates :register, :value, :presence => true

  def name
    register.name
  end

  def adress
    register.adress
  end

  def set_value
    register.set_value value
  end


  def self.value= value
    self.value = value.upcase
  end

  def is_reached?
    if self.value == self.register.value
      true
    else
      false
    end
  end
end

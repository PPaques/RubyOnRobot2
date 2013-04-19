class StatusRegister < ActiveRecord::Base
  attr_accessible :register_id, :value

  belongs_to  :register
  belongs_to  :status

  validates :register, :value, :presence => true


  def name
    register.name
  end

  def address
    address.name
  end
end

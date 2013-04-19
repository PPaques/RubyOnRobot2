class StatusRegister < ActiveRecord::Base
  attr_accessible :register, :value

  has_one :register
  belongs_to :status
end

class StatusGpio < ActiveRecord::Base
  attr_accessible :gpio_id, :value

  has_one :gpio

  belongs_to :status
end

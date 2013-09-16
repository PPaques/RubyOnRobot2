# -*- encoding : utf-8 -*-
require 'clockwork'
# load the entire env
require './config/boot'
require './config/environment'

include Clockwork

handler do |job|
  puts "Running #{job}"
end

#every(0.5, 'Timer_Robot') { Timer.execute}

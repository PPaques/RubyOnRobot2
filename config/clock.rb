# -*- encoding : utf-8 -*-
require 'clockwork'
# load the entire env
require './config/boot'
require './config/environment'

include Clockwork

handler do |job|
  puts "Running #{job}"
end

#every(1.seconds, 'Timer_Robot') { Timer.robot.exe}

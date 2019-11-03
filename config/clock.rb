require "clockwork"
require "active_support/time"

module Clockwork
    # handler do |job|
    #     puts "Running job"
    # end
    
    every(1.minutes, 'puts "Running job"')
end

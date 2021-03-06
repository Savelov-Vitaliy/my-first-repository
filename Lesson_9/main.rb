require_relative 'accessors.rb'
require_relative 'validation.rb'
require_relative 'instance_counter.rb'
require_relative 'company.rb'
require_relative 'station.rb'
require_relative 'route.rb'
require_relative 'train.rb'
require_relative 'passenger_train.rb'
require_relative 'cargo_train.rb'
require_relative 'wagon.rb'
require_relative 'passenger_wagon.rb'
require_relative 'cargo_wagon.rb'
require_relative 'railway.rb'
require_relative 'control.service.rb'
require_relative 'control.station.rb'
require_relative 'control.route.rb'
require_relative 'control.train.rb'
require_relative 'control.rb'

control = Control.new(RailWay.new)
control.help
control.start

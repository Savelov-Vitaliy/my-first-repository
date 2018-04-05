require_relative "route.rb"
require_relative "station.rb"
require_relative "train.rb"
require_relative "passenger_train.rb"
require_relative "cargo_train.rb"
require_relative "passenger_wagon.rb"
require_relative "cargo_wagon.rb"
require_relative "railway.rb"
require_relative "control.rb"

control = Control.new(RailWay.new)
control.help
control.start

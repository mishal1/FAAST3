require 'passenger_holder'
class Carriage
	include PassengerHolder

	attr_reader :people

	def initialize
		@people = []
	end

	def all_move_to(station)
		people.each do |passenger|
			station.hold(passenger)
			alight(passenger)
		end
	end

end
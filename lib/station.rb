require 'passenger_holder'
class Station

	include PassengerHolder

	attr_reader :people, :trains

	def initialize
		@people = []
		@trains = []
	end

	def raise_error(text)
		raise text if trains.count == 0
	end

	def board(carriage, passenger)
		raise_error("There is no train in the station to board")
		carriage.hold(passenger)
		alight(passenger)
	end

	def empty(carriage, passenger)
		raise_error("The train must be in the station to leave it")
		carriage.alight(passenger)
		hold(passenger)
	end

	def all_board(carriage)
		raise_error("There is no train in the station to board")
		people.each do |passenger| 
			carriage.hold(passenger)
			alight(passenger)
		end
	end

	def all_empty(carriage)
		raise_error("The train must be in the station to leave it")
		carriage.all_move_to(self)
	end

	def dock(train)
		raise "The station is full" if !trains.empty?
		trains << train 
	end

	def release(train)
		trains.delete(train)
	end
end
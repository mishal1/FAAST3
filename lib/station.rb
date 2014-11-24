require 'passenger_holder'
class Station

	include PassengerHolder

	attr_accessor :people, :trains

	def initialize
		@people = []
		@trains = []
	end

	def board(carriage, passenger)
		raise "There is no train in the station to board" if trains.count == 0
		carriage.hold(passenger)
		alight(passenger)
	end

	def empty(carriage, passenger)
		raise "The train must be in the station to leave it" if trains.count ==0
		carriage.alight(passenger)
		hold(passenger)
	end

	def all_board(carriage)
		raise "There is no train in the station to board" if trains.count == 0
		people.each do |passenger| 
			carriage.hold(passenger)
			alight(passenger)
		end
	end

	def all_empty(carriage)
		raise "The train must be in the station to leave it" if trains.count ==0
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
class Station

	attr_accessor :people, :trains

	def initialize
		@people = []
		@trains = []
	end

	def hold(passenger)
		return raise "You aren't tapped into the station" if !passenger.tapped_in?
		people << passenger
	end

	def alight(passenger)
		people.delete(passenger)
	end

	def dock(train)
		return raise "The station is full" if !trains.empty?
		trains << train 
	end

	def release(train)
		trains.delete(train)
	end

	def board(carriage)
		return raise "There is no train in the station to board" if trains.count == 0
		people.each do |passenger| 
			carriage.hold(passenger)
			alight(passenger)
		end
	end

	def empty(carriage)
		return raise "The train must be in the station to leave it" if trains.count ==0
		carriage.move_to(self)
	end

end
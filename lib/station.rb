class Station

	attr_accessor :people, :trains

	def initialize
		@people = []
		@trains = []
	end

	def hold(passenger)
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

end
class Train

	attr_accessor :carriages

	def initialize
		@inside_of_station = false
		@carriages = []
	end

	def inside_of_station?
		@inside_of_station
	end

	def stop_at(station)
		@inside_of_station = true
		station.dock(self)
	end

	def move_out_of(station)
		@inside_of_station = false
		station.release(self)
	end

	def attach(carriage)
		@carriages << carriage
	end

	def detach(carriage)
		@carriages.delete(carriage)
	end

end
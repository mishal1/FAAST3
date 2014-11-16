class Train

	attr_accessor :carriages

	def initialize
		@carriages = []
	end

	def stop_at(station)
		station.dock(self)
	end

	def move_out_of(station)
		station.release(self)
	end

	def attach(carriage)
		@carriages << carriage
	end

	def detach(carriage)
		@carriages.delete(carriage)
	end

end

#carriages can attach to any train even if already attached
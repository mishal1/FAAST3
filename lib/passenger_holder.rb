module PassengerHolder

	def hold(passenger)
		raise "The train is full" if people.count == 40
		raise "The passenger is not tapped in" if !passenger.tapped_in?
		people << passenger
	end

	def alight(passenger)
			people.delete(passenger)
	end

end
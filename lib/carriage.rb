class Carriage

	attr_accessor :people

	def initialize
		@people = []
	end

	def hold(passenger)
		raise "The train is full" if people.count == 40
		people << passenger
	end

	def alight(passenger)
			people.delete(passenger)
	end

	def all_move_to(station)
		people.each do |passenger|
			station.hold(passenger)
			alight(passenger)
		end
	end

end
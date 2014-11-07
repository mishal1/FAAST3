require 'passenger'

describe Passenger do

	let(:passenger) {Passenger.new}

	it "should not be tapped into a station when initalized" do
		expect(passenger.tapped_in?).to be false

	end

	it "should be able to tap into the station" do
		passenger.tap_into_station
		expect(passenger.tapped_in?).to be true
	end

	it "should be able to leave the station" do
		passenger.tap_into_station
		passenger.tap_out_of_station
		expect(passenger.tapped_in?).to be false
	end

end

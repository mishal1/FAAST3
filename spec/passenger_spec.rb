require 'passenger'

describe Passenger do

	let(:passenger) {Passenger.new}
	let(:station)	{double :station}

	it "should not be tapped into a station when initalized" do
		expect(passenger.tapped_in?).to be false

	end

	it "should be able to tap into the station" do
		expect(station).to receive(:hold).with(passenger)
		passenger.tap_into(station)
		expect(passenger.tapped_in?).to be true
	end

	it "should be able to leave the station" do
		allow(station).to receive(:release).with(passenger)
		passenger.tap_out_of(station)
		expect(passenger.tapped_in?).to be false
	end

	it "should automatically move into the station when tapped in" do
		expect(station).to receive(:hold).with(passenger)
		passenger.tap_into(station)
	end

	it "should automatically move out of the station when tapped out" do
		expect(station).to receive(:release).with(passenger)
		passenger.tap_out_of(station)
	end

end

#should have some type of payment system

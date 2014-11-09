require 'passenger'

describe Passenger do

	let(:passenger) {Passenger.new}
	let(:station)	{double :station}

	it "should not be tapped into a station when initalized" do
		expect(passenger.tapped_in?).to be false

	end

	it "should be able to tap into the station" do
		passenger.top_up(5)
		expect(station).to receive(:hold).with(passenger)
		passenger.tap_into(station)
		expect(passenger.tapped_in?).to be true
	end

	it "should be able to leave the station" do
		allow(station).to receive(:alight).with(passenger)
		passenger.tap_out_of(station)
		expect(passenger.tapped_in?).to be false
	end

	it "should automatically move into the station when tapped in" do
		passenger.top_up(5)
		expect(station).to receive(:hold).with(passenger)
		passenger.tap_into(station)
	end

	it "should automatically move out of the station when tapped out" do
		expect(station).to receive(:alight).with(passenger)
		passenger.tap_out_of(station)
	end

	it "should have no money on their oyster when initalized" do
		expect(passenger.oyster_amount).to eq(0)
	end

	it "should be able to top up their oyster" do
		passenger.top_up(5)
		expect(passenger.oyster_amount).to eq(5)
	end

	it "should not be able to tap into station if the passenger doesn't have any money" do
		allow(station).to receive(:hold).with(passenger)
		expect{passenger.tap_into(station)}.to raise_error(RuntimeError)
	end

	it "should charge the user £2 per trip" do
		allow(station).to receive(:hold).with(passenger)
		passenger.top_up(5)
		passenger.tap_into(station)
		expect(passenger.oyster_amount).to eq(3)
	end

end

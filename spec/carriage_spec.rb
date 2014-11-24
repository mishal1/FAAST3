require 'carriage'
require_relative 'passenger_holder_spec'

describe Carriage do

	let(:carriage)  	{Carriage.new     }
	let(:passenger) 	{double :passenger, :tapped_in? => true}
	let(:station)		{double :station  }

	it_behaves_like 'PassengerHolder'

	it "should have a capcity of 40" do
		40.times {carriage.hold(passenger)}
		expect{carriage.hold(passenger)}.to raise_error(RuntimeError)
	end

	it "should have all the passengers move to the station" do
		carriage.hold(passenger)
		expect(station).to receive(:hold).with(passenger)
		carriage.all_move_to(station)
	end

	it "people count should decrease when passengers move to the station" do
		carriage.hold(passenger)
		allow(station).to receive(:hold).with(passenger)
		carriage.all_move_to(station)
		expect(carriage.people).to eq([])
	end
	
end

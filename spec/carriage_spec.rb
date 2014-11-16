require 'carriage'

describe Carriage do

	let(:carriage)  	{Carriage.new     }
	let(:passenger) 	{double :passenger}
	let(:station)		{double :station  }

	it "should have no passengers when created" do
		expect(carriage.people).to eq([])
	end

	it "should hold passengers" do
		carriage.hold(passenger)
		expect(carriage.people).to eq([passenger])
	end

	it "should allow passengers to leave the train" do
		carriage.alight(passenger)
		expect(carriage.people).to eq([])
	end

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

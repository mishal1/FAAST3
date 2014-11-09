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
	
end

#all the passengers should board/leave the carriage
#changes methods to private

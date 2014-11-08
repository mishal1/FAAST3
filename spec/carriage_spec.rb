require 'carriage'

describe Carriage do

	let(:carriage)  			{Carriage.new     }
	let(:passenger) 			{double :passenger}
	# let(:station_without_train)	{double :station  }
	let(:station_with_train)	{double :station  }
	# let(:train)					{double :train, :in_station => true}

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

	# it "should only allow people to board the train when it is in the station" do

	# end
	
end

# hold passengers
# release passengers
# should allow people on the train when the train is in the station
# should allow people off the train when the train is in the station
# have a capacity of 40
#all the passengers should board/leave the carriage

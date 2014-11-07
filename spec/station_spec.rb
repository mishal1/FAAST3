require 'station'

describe Station do

	let(:station)   {Station.new}
	let(:passenger) {double :passenger}
	let(:train)		{double :train}
	
	context "Passengers" do

		it "should have no people in the station when created" do
			expect(station.people).to eq([])
		end	

		it "should be able to hold a passenger in the station" do
			station.hold(passenger)
			expect(station.people).to eq([passenger])
		end

		it "should allow a passenger to leave the station" do
			station.hold(passenger)
			station.alight(passenger)
			expect(station.people).to eq([])
		end

#add a capacity method
	end

	context "Trains" do

		it "should not have any trains in the station when created" do
			expect(station.trains).to eq([])
		end

		it "should be able to dock a train" do
			station.dock(train)
			expect(station.trains).to eq([train])
		end

		it "should be able to leave the station" do
			station.dock(train)
			station.release(train)
			expect(station.trains).to eq([])
		end

		it "can only have one train at the station" do
			station.dock(train)
			expect{station.dock(train)}.to raise_error(RuntimeError)
		end

	end

end
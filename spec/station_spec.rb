require 'station'

describe Station do

	let(:station)   {Station.new      }
	let(:passenger) {double :passenger}
	let(:train)		{double :train    }
	let(:carriage)	{double :carriage, :people => [passenger]}
	
	context "Passengers" do

		it "should have no people in the station when created" do
			expect(station.people).to eq([])
		end	

		it "should be able to hold a passenger in the station" do
			station.hold(passenger)
			expect(station.people).to eq([passenger])
		end

		it "should allow a passenger to leave the station" do
			station.alight(passenger)
			expect(station.people).to eq([])
		end

#add a capacity method
#person cannot enter station if tapped in is false
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
			station.release(train)
			expect(station.trains).to eq([])
		end

		it "can only have one train at the station" do
			station.dock(train)
			expect{station.dock(train)}.to raise_error(RuntimeError)
		end

	end

	context "Carriage" do

		it "should allow passengers to board the carriage from the station" do
			station.dock(train)
			station.hold(passenger)
			expect(carriage).to receive(:hold).with(passenger)
			station.board(carriage)
		end

		it "should have no passengers at the station when the carriage has been boarded" do
			station.dock(train)
			station.hold(passenger)
			allow(carriage).to receive(:hold).with(passenger)
			station.board(carriage)
			expect(station.people).to eq([])
		end

		it "should not allow passengers to board the train if there is no train in that station" do
			station.hold(passenger)
			allow(carriage).to receive(:hold).with(passenger)
			expect{station.board(carriage)}.to raise_error(RuntimeError)
		end

		it "should be able have passengers get out of the carriage" do
			station.dock(train)
			expect(carriage).to receive(:move_to)
			station.empty(carriage)
		end

		it "there should be one person in the station after carriage emptied" do
			station.dock(train)
			allow(carriage).to receive(:move_to).with(station)
			station.empty(carriage)
			expect(station.people.count).to eq(1)
		end

	end

end
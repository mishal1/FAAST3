require 'station'
require_relative 'passenger_holder_spec'

describe Station do

	let(:station)   			{Station.new      }
	let(:passenger) 			{double :passenger, :tapped_in? => true}
	let(:passenger_not_tapped)	{double :passenger, :tapped_in? => false}
	let(:train)					{double :train    }
	let(:carriage)				{double :carriage, :people => [passenger]}
	
	it_behaves_like 'PassengerHolder'

	context "Passengers" do

		it "should not allow people to enter the station if they are not tapped in" do
			expect{station.hold(passenger_not_tapped)}.to raise_error(RuntimeError)
		end

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
			station.all_board(carriage)
		end

		it "should have no passengers at the station when the carriage has been boarded" do
			station.dock(train)
			station.hold(passenger)
			allow(carriage).to receive(:hold).with(passenger)
			station.all_board(carriage)
			expect(station.people).to eq([])
		end

		it "should not allow passengers to board the train if there is no train in that station" do
			station.hold(passenger)
			allow(carriage).to receive(:hold).with(passenger)
			expect{station.all_board(carriage)}.to raise_error(RuntimeError)
		end

		it "should be able have passengers get out of the carriage" do
			station.dock(train)
			expect(carriage).to receive(:all_move_to).with(station)
			station.all_empty(carriage)
		end

		it "should not allow passengers to get out of the train if there is no train in that station" do
			allow(carriage).to receive(:all_move_to).with(station)
			expect{station.all_empty(carriage)}.to raise_error(RuntimeError)
		end

		it "should allow a specific passenger onto the carriage" do
			station.dock(train)
			expect(carriage).to receive(:hold).with(passenger)
			station.board(carriage, passenger)
		end

		it "should have one less passenger in the station" do
			station.dock(train)
			station.hold(passenger)
			allow(carriage).to receive(:hold).with(passenger)
			expect{station.board(carriage, passenger)}.to change{station.people.count}.by(-1)
		end

		it "should have allow a specific person to leave the carriage" do
			station.dock(train)
			expect(carriage).to receive(:alight).with(passenger)
			station.empty(carriage, passenger)
		end

		it "should have one more passenger in the station" do
			station.dock(train)
			allow(carriage).to receive(:alight).with(passenger)
			expect{station.empty(carriage, passenger)}.to change{station.people.count}.from(0).to(1)
		end

	end

end
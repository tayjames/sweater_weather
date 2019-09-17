require 'rails_helper'

describe GoogleService do
  context "instance methods" do
    context "#coordinates_by_location" do
      it "returns coordinates data" do
        search = subject.coordinates_by_location("denver,co")
        # binding.pry
        expect(search).to be_a Hash
        expect(search.count).to eq 2
        expect(search).to have_key :lat
        expect(search).to have_key :lng
      end
    end
  end
end

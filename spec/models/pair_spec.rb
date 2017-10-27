require 'rails_helper'

RSpec.describe Pair, type: :model do
  describe "round-robin algorithm" do
    let!(:user) { create_list :user, 10 }

    it "generates pairs for certain amount of days" do
      expect(Pair.generate_pairs.size).to eq(9)
      expect(Pair.generate_pairs.uniq.length).to eq(Pair.generate_pairs.length)
      expect(Pair.generate_pairs.first.uniq.length).to eq(Pair.generate_pairs.first.length)
    end
  end
end

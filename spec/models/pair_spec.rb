require 'rails_helper'

RSpec.describe Pair, type: :model do
  describe "round-robin algorithm" do
    let!(:user) { create_list :user, 10 }


    it "generates pairs" do
      expect { Pair.generate_pairs.create }.to change(GeneratedPair, :count).by(-1)
    end
  end
end

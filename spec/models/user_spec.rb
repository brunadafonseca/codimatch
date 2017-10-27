require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    FactoryGirl.create :user, id: 1, email: "dumbledore@codimatch.com", admin: true
    FactoryGirl.create :user, id: 2, email: "snape@codimatch.com", admin: true
    FactoryGirl.create :user, id: 3, email: "sirius@codimatch.com", admin: false
  end
  it "returns a sorted array of admins" do

    User.order_users.should == ["dumbledore.codimatch.com", "snape.codimatch.com"]
  end
end

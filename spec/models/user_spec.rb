require 'spec_helper'

describe User do
  it "should validate required fields" do
    user = FactoryGirl.build(:user)
    user.should be_valid
  end
end
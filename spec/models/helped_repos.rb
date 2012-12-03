require 'spec_helper'

describe HelpedRepo do

  describe "base" do
    it "has a valid factory" do
      FactoryGirl.build(:helped_repo).should be_valid
    end
  end

  describe "validations" do
    before(:each) do
      @helped_repo = FactoryGirl.build(:helped_repo)
    end

    it "is invalid without a really_helping" do
      @helped_repo.really_helping = nil
      @helped_repo.should_not be_valid
    end

    it "is invalid without a repo" do
      @helped_repo.repo = nil
      @helped_repo.should_not be_valid
    end

    it "is invalid without a user" do
      @helped_repo.user = nil
      @helped_repo.should_not be_valid
    end

  end

end
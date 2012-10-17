require 'spec_helper'

describe HelpedRepos do

  describe "base" do
    it "has a valid factory" do
      FactoryGirl.build(:helped_repos).should be_valid
    end
  end

  describe "validations" do
    before(:each) do
      @helped_repos = FactoryGirl.build(:helped_repos)
    end

    it "is invalid without a really_helping" do
      @helped_repos.really_helping = nil
      @helped_repos.should_not be_valid
    end

    it "is invalid without a repo" do
      @helped_repos.repo = nil
      @helped_repos.should_not be_valid
    end

    it "is invalid without a user" do
      @helped_repos.user = nil
      @helped_repos.should_not be_valid
    end

  end

end
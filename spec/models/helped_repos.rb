require 'spec_helper'

describe HelpedRepo do

  describe "base" do
    it "has a valid factory" do
      expect(build(:helped_repo)).to be_valid
    end
  end

  describe "validations" do
      let(:helped_repo) { build(:helped_repo) }

    it "is invalid without a really_helping" do
      helped_repo.really_helping = nil
      expect(helped_repo).to_not be_valid
    end

    it "is invalid without a repo" do
      helped_repo.repo = nil
      expect(helped_repo).to_not be_valid
    end

    it "is invalid without a user" do
      helped_repo.user = nil
      expect(helped_repo).to_not be_valid
    end

  end

end
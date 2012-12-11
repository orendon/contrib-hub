require 'spec_helper'

describe Repo do

  describe "base" do
    it "has a valid factory" do
      expect(build(:repo)).to be_valid
    end
  end

  describe "validations" do
    let(:repo) { build(:repo) }

    it "is invalid without a github_url" do
      repo.github_url = nil
      expect(repo).to_not be_valid
    end

    it "is invalid without a name" do
      repo.name = nil
      expect(repo).to_not be_valid
    end

    it "is invalid without a user" do
      repo.user = nil
      expect(repo).to_not be_valid
    end

  end

end

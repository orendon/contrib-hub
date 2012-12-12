require 'spec_helper'

describe User do

  describe "base" do
    it "has a valid factory" do
      expect(build(:user)).to be_valid
    end
  end

  describe "validations" do
    let(:user) { FactoryGirl.build(:user) }

    it "is invalid without a github_id" do
      user.github_id = nil
      expect(user).to_not be_valid
    end

    it "is invalid without a name" do
      user.name = nil
      expect(user).to be_valid
    end

    it "is invalid without a token" do
      user.token = nil
      expect(user).to_not be_valid
    end

    it "is invalid with a duplicate github_id" do
      user_1 = create(:user)
      expect(build(:user, github_id: user_1.github_id)).to_not be_valid
    end
  end

  describe "update_repo_status" do
      let(:user) { create(:user) }
      let(:repo) { create(:repo) }

    it "removes the helping connection if it exists" do
      create(:helped_repo, repo: repo, user: user)
      user.update_repo_status(repo)
      expect(user.helped_repos.where(repo_id: repo.id).count).to eq 0
    end

  #   it "adds the helping connection if it does not exist" do
  #     @user.update_repo_status(@repo)
  #     @user.helped_repos.where(repo_id: @repo.id).count.should == 1
  #   end
  end

end
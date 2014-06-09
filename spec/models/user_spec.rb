require 'spec_helper'

describe User do
  let(:user) { FactoryGirl.create(:user) }

  describe "base" do
    let(:user) { FactoryGirl.build(:user) }
    it "has a valid factory" do
      expect(user).to be_valid
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
      let(:repo) { create(:repo) }

    it "removes the helping connection if it exists" do
      create(:helped_repo, repo: repo, user: user)
      user.update_repo_status(repo)
      expect(user.helped_repos.where(repo_id: repo.id).count).to eq 0
    end
  end

  describe "#sync_github_data" do
    it "call #sync_github_user, #sync_github_repos" do
      user.stub_chain(:sync_github_user, :sync_github_repos)
      user.should_receive :sync_github_user
      user.should_receive :sync_github_repos
      user.sync_github_data
    end
  end

  describe "#sync_github_user" do
    it "update from github data" do
      GithubUtils.stub(:get_user_details_for).and_return({name: "Jon Snow"})
      user.sync_github_user
      expect(user.name).to eq "Jon Snow"
    end
  end

  describe "#sync_github_repos" do
    it "update from github data" do
      GithubUtils.stub(:get_user_details_for).and_return({name: "Jon Snow"})
      user.sync_github_user
      expect(user.name).to eq "Jon Snow"
    end
  end
end

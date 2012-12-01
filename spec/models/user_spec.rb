require 'spec_helper'

describe User do

  describe "base" do
    it "has a valid factory" do
      FactoryGirl.build(:user).should be_valid
    end
  end

  describe "validations" do
    before(:each) do
      @user = FactoryGirl.build(:user)
    end

    it "is invalid without a github_id" do
      @user.github_id = nil
      @user.should_not be_valid
    end

    it "is invalid without a name" do
      @user.name = nil
      @user.should_not be_valid
    end

    it "is invalid without a token" do
      @user.token = nil
      @user.should_not be_valid
    end

    it "is invalid with a duplicate github_id" do
      FactoryGirl.create(:user, github_id: 1)
      FactoryGirl.build(:user, github_id: 1).should_not be_valid
    end
  end

  describe "update_repo_status" do
    before(:each) do
      @user = FactoryGirl.create(:user)
      @repo = FactoryGirl.create(:repo)
    end
    it "removes the helping connection if it exists" do
      FactoryGirl.create(:helped_repos, repo: @repo, user: @user)
      @user.update_repo_status(@repo)
      HelpedRepos.where(repo_id: @repo.id, user_id: @user.id).count.should == 0
    end
    
    it "adds the helping connection if it does not exist" do
      @user.update_repo_status(@repo)
      HelpedRepos.where(repo_id: @repo.id, user_id: @user.id).count.should == 1
    end
  end

end
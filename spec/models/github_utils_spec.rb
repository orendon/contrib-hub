require "spec_helper"

describe GithubUtils do
  let(:token) { 'x' * 30 }
  let(:user) { double(github_id: 'test', token: token) }

  context "when retrieving a user's repository list" do
    let(:repos_instance) { double(Github::Repos.name) }

    before do
      Github::Repos.stub(:new) { repos_instance }
      repos_instance.should_receive(:auto_pagination=).with(true)
      repos_instance.should_receive(:all).with(user: 'test')
    end

    it "retrieves all of the user's repositories" do
      GithubUtils.get_repos_list_for(user)
    end
  end

  context "when retrieving details about a user" do
    let(:github_instance) { double(Github.name) }
    let(:users) { double(get: {}) }

    before do
      Github
        .should_receive(:new)
        .with(oauth_token: token)
        .and_return(github_instance)
      github_instance.should_receive(:users).and_return(users)
    end

    it "retrieves and normalizes the user's details" do
      normalized = GithubUtils.get_user_details_for(user)
      %i(
        email
        name
        avatar_url
        followers
        following
        public_repos
        public_gists
        github_url
      ).each { |attr| expect(normalized[attr]).to be_nil }
      expect(normalized[:last_sync]).to_not be_nil
    end
  end
end

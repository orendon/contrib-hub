require "spec_helper"

describe GithubUtils do
  let(:token) { 'x' * 30 }
  let(:user) { double(github_id: 'test', token: token) }

  context "when retrieving information about a user's repositories" do
    let(:repos_instance) { double(Github::Repos.name) }
    let(:repos_list) { [double(full_name: 'contrib-hub')] }

    before do
      allow(Github::Repos).to receive(:new) { repos_instance }
      expect(repos_instance).to receive(:auto_pagination=).with(true)
      expect(repos_instance).to receive(:all).with(user: 'test')
        .and_return(repos_list)
    end

    it "retrieves all of the user's repositories" do
      GithubUtils.get_repos_list_for(user)
    end

    it "retrieves a repository's details" do
      repo = GithubUtils.get_repo_details(user, 'contrib-hub')
      expect(repo.full_name).to eq('contrib-hub')
    end
  end

  context "when retrieving details about a user" do
    let(:github_instance) { double(Github.name) }
    let(:users) { double(get: {}) }

    before do
      expect(Github)
        .to receive(:new)
        .with(oauth_token: token)
        .and_return(github_instance)
      expect(github_instance).to receive(:users).and_return(users)
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

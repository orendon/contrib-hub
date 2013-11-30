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
end

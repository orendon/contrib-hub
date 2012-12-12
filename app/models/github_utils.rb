class GithubUtils
  def self.get_repos_list_for(user)
    repos = Github::Repos.new
    repos.all user: user.github_id
  end

  def self.get_user_details_for(user)
    github = Github.new oauth_token: user.token
    github.users
  end

  def self.get_repo_details(user, repo_name)
    repos = get_repos_list_for(user)
    repos.find { |x| x.full_name == repo_name }
  end
end
class GithubUtils
  def self.get_repos_list_for(user)
    repos = Github::Repos.new
    repos.all user: user.github_id
  end

  def self.get_user_details_for(user)
    github = Github.new oauth_token: user.token
    normalize_user(github.users)
  end

  def self.get_repo_details(user, repo_name)
    repos = get_repos_list_for(user)
    repos.find { |x| x.full_name == repo_name }
  end

  private

  def self.normalize_user(user)
    normalized_user = {}
    %w(email name avatar_url followers following public_repos public_gists)
      .each { |attr| normalized_user[attr.to_sym] = user.get.send(attr.to_sym) }

    normalized_user[:github_url]  = user.get[:html_url]
    normalized_user[:last_sync]   = Time.now
    normalized_user
  end

  def self.normalize_repo(repo)
    normalized_repo = {}
    %w(name full_name description language forks watchers open_issues pushed_at)
      .each { |attr| normalized_repo[attr.to_sym] = repo.send(attr.to_sym) }

    normalized_repo[:github_url]  = repo[:html_url]
    normalized_repo[:last_sync]   = Time.now
    normalized_repo
  end
end
class HelpedRepos < ActiveRecord::Base
  attr_accessible :really_helping, :repo_id, :user_id

  belongs_to :user
  belongs_to :repo

  validates :repo, :user, :presence => true
  validates :really_helping, :inclusion => { in: [true, false] }
end

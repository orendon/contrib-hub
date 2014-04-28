class HelpedRepo < ActiveRecord::Base

  belongs_to :user
  belongs_to :repo

  validates :repo, :user, :presence => true
  validates :really_helping, :inclusion => { in: [true, false] }

  delegate :github_url, to: :repo
end

module UsersHelper
  def status(repo)
    'hidden' unless repo[:need_help]
  end
end

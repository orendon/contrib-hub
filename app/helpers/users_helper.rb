module UsersHelper
  def status(repo)
    repo[:need_help] ? 'hidden' : ''
  end
end

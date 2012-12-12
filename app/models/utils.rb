module Utils

  def get_all_languages
    languages_list = Repo.select(:language).uniq
    languages_list.collect(&:language).reject { |l| l.nil? || l.empty? }
  end

  def get_all_tag_names
    tags = ActiveRecord::Base.connection.execute("SELECT name FROM tags")
    tags.map { |tag| tag["name"] }
  end

end
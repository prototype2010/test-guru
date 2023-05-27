module ApplicationHelper
  def current_year
    Date.current.year
  end

  def github_url(author, repo)
    link_to author, "https://github.com/prototype2010/#{repo}"
  end
end

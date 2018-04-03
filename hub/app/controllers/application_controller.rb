class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  def ql(query, vars = {})
    GitHubQLHelper.query(query, vars)
  end
end

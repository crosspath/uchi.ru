Rails.application.routes.draw do
  get ':repo_owner/:repo_name/contributors/:count' => 'contributors#show'
end

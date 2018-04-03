class ContributorsController < ApplicationController
  def show
    params_keys = %i[repo_owner repo_name count]
    vars = params.permit(*params_keys).to_h
    vars[:count] = vars[:count].to_i
    
    result = ql RepoContributorsQuery, vars
    repo = result.repository
    
    if repo
      render json: repo.collaborators
    else
      render json: {errors: result.errors}
    end
  end
end

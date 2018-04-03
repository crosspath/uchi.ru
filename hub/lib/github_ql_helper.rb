module GitHubQLHelper
  module_function
  
  def access_token
    @@access_token ||= File.read(Rails.root.join('config', 'github-token.txt')).strip
  end
  
  def client_context
    @@client_context ||= {access_token: GitHubQLHelper.access_token}
  end
  
  def query(defn, vars = {})
    response = Hub::Client.query(defn, variables: vars, context: GitHubQLHelper.client_context)
    
    if response.errors.any?
      raise ArgumentError.new(response.errors[:data].join(", "))
    else
      response.data
    end
  end
end

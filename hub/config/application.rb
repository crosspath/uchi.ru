require_relative 'boot'

# require 'rails/all'
require 'rails'
require "action_controller/railtie"
require "action_view/railtie"
require "graphql/client/railtie"
require "graphql/client/http"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

Dir[__dir__ + '/../lib/*.rb'].each { |x| require x }

module Hub
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
  
  HTTPAdapter = GraphQL::Client::HTTP.new("https://api.github.com/graphql") do
    def headers(context)
      unless token = context[:access_token] || ::GitHubQLHelper.access_token
        # $ GITHUB_ACCESS_TOKEN=abc123 bin/rails server
        #   https://help.github.com/articles/creating-an-access-token-for-command-line-use
        fail "Missing GitHub access token"
      end

      {
        "Authorization" => "Bearer #{token}"
      }
    end
  end

  Client = GraphQL::Client.new(
    schema: Application.root.join("db/schema.json").to_s,
    execute: HTTPAdapter
  )
  Application.config.graphql.client = Client
end

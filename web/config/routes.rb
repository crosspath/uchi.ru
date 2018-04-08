Rails.application.routes.draw do
  root to: 'welcome#index'
  get 'github/contributors' => 'welcome#contributors' # :repo => 'owner/name', :count => number
  get 'github/diploma' => 'welcome#diploma' # :repo => 'owner/name', :login => 'string', :name => 'string'
end

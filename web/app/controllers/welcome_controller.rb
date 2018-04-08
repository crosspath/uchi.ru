require 'net/http'
require 'cgi'
require 'json'

class WelcomeController < ApplicationController
  before_action :set_input_data, only: [:contributors, :diploma]
  before_action :assert_repo, only: [:contributors, :diploma]
  before_action :assert_count, only: :contributors
  
  def index
    # form
  end
  
  def contributors
    hub_response = call_uri(:hub, "/#{@data[:repo]}/contributors/#{@data[:count]}")
    
    @errors = []
    hub_json = JSON.parse(hub_response)
    if hub_json['data'].is_a?(Hash) && hub_json['data']['nodes'].is_a?(Array)
      @contributors = hub_json['data']['nodes']
    else
      @errors = hub_json['errors']
    end
    # render welcome/contributors
  rescue => e
    @errors << [e.class.name, e.message]
  end
  
  def diploma
    query = "repo=#{@data[:repo]}&login=#{CGI.escape @data[:login]}&name=#{CGI.escape @data[:name]}"
    pdf_response = call_uri(:pdf, "/diploma?#{query}")
    send_data pdf_response,
      filename: "#{@data[:name]}.pdf",
      type: 'application/pdf',
      disposition: 'inline' # show in browser
  rescue => e
    @errors = [[e.class.name, e.message]]
    render 'welcome/contributors'
  end
  
  protected
  
  def set_input_data
    @data = params.permit(:repo, :count, :login, :name).to_h
  end
  
  def assert_repo
    if @data[:repo] !~ /^[a-z\d_]+\/[a-z\d_]+$/
      head 403
      render text: 'Некорректное значение: репозиторий'
    end
  end
  
  def assert_count
    if @data[:count] !~ /^\d+$/
      head 403
      render text: 'Некорректное значение: количество участников'
    end
  end
  
  def call_uri(service_key, uri)
    service = Rails.application.config.services[service_key]
    Net::HTTP.get(service[0], uri, service[1]) # host, uri, port
  end
end

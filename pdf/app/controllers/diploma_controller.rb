class DiplomaController < ApplicationController
  def show
    @data = params.permit(:repo, :login, :name).to_h
    
    render pdf: 'show', layout: false
  end
end

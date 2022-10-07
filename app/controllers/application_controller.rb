class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Returns all portfolios
  get "/portfolios" do
    portfolio = Portfolio.all
    portfolio.to_json
  end

  get "/portfolios/id" do
    portfolio = Portfolio.find(params[:id])
    portfolio.to_json
  end
end

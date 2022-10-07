class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'

  # Returns only website portfolio data
  get "/portfolios/website" do
    portfolio = Portfolio.where(name: "Website Development")
    portfolio.to_json(include: {projects: {include: [:photos, :links]}})
  end

  # Returns only graphic portfolio data
  get "/portfolios/graphic" do
    portfolio = Portfolio.where(name: "Graphic Design")
    portfolio.to_json(include: {projects: {include: [:photos, :links]}})
  end

  # Returns only blog portfolio data
  get "/portfolios/blog" do
    portfolio = Portfolio.where(name: "Blog")
    portfolio.to_json(include: {projects: {include: [:photos, :links]}})
  end

  get "/questions" do
    question = Question.all
    question.to_json(include: :user)
  end

end

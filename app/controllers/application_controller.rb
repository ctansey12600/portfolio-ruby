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

  post "/questions" do
    user = User.create(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email]
    )

    question = Question.create(
      question: params[:question],
      user_id: user.id
    )

    question.to_json
  end

end

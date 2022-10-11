class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'

  # Returns by name match rather than id to ensure that loaded info is the same regardless if id where to change
  # Returns only website portfolio data
  get "/portfolios/website" do
    portfolio = Portfolio.find_by(name: 'Website Development')
    portfolio.to_json(include: {projects: {include: [:photos, :links]}})
  end

  # Returns only graphic portfolio data
  get "/portfolios/graphic" do
    portfolio = Portfolio.find_by(name: 'Graphic Design')
    portfolio.to_json(include: {projects: {include: [:photos, :links]}})
  end

  # Returns only blog portfolio data
  get "/portfolios/blog" do
    portfolio = Portfolio.find_by(name: 'Blog')
    portfolio.to_json(include: {projects: {include: [:photos, :links]}})
  end

  # Returns all questions
  get "/questions" do
    question = Question.all
    question.to_json(include: :user)
  end

  # Creates questions and user on submit
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

  delete '/questions/:id' do
    # find the question using the ID
    question = Question.find(params[:id])
    # delete the question
    question.destroy
    # send a response with the deleted question as JSON
    question.to_json
  end

  patch '/questions/:id' do
    question = Question.find(params[:id])
    question.update(
     question: params[:question]
    )
    question.to_json
  end

end

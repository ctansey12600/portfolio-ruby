class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'

  #Returns all portfolios
  get "/portfolios" do
    portfolio = Portfolio.all
    portfolio.to_json(include: {projects: {include: [:photos, :links]}})
  end

  #Returns portfolio by id
  get "/portfolios/:id" do
    portfolio = Portfolio.find(params[:id])
    portfolio.to_json(include: {projects: {include: [:photos, :links]}})
  end

  # Returns all questions
  get "/questions" do
    question = Question.all
    question.to_json(include: :user)
  end

  # Creates questions and user on submit
  post "/questions" do
    user = User.find_or_create_by(
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

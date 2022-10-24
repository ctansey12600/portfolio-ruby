class ApplicationController < Sinatra::Base
  set :default_content_type, "application/json"

  #Returns all portfolios
  get '/portfolios' do
    portfolio = Portfolio.all
    portfolio.to_json(include: {projects: {include: [:photos, :links]}})
  end

  #Returns portfolio by id
  get '/portfolios/:id' do
    portfolio = Portfolio.find(params[:id])
    portfolio.to_json(include: {projects: {include: [:photos, :links]}})
  end

  # Finds Portfolio by name and then returns most recent project id
  get '/portfolios/recentProject/:name' do
    portfolio = Portfolio.includes(:projects).find_by(name: params[:name],)
    recent = portfolio.projects.first
    recent.to_json(only: :id)
  end

  # Finds Portfolio by name and then returns most liked project id
  get '/projects/myFavorite/:name' do
    project = Project.find_by(name: params[:name],)
    project.to_json(only: :id)
  end

  # Returns all questions
  get '/questions' do
    question = Question.all
    question.to_json(include: {user: { only: [:first_name, :user_id] }})
  end

  # Creates questions and user on submit
  post '/questions' do

    user = User.find_or_create_by(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email]
    )

    question = user.questions.create(
      question: params[:question]
      # user_id: user.id
    )

    question.to_json(include: {user: { only: [:first_name, :user_id] }})
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
     question: params[:question],
     answer: params[:answer]
    )
    question.to_json(include: {user: { only: [:first_name, :user_id] }})
  end

end

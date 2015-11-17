class QuestionsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    authenticate_user!
    @last_viewed_question = Question.find(session[:last_viewed_question_id])
    @questions = Question.all.order(session[:sort_by])
    if current_user
      @questions = current_user.question
    else
      @questions = Question.all
    end
  end

  def set_question
  end

  def sort
    session[:sort_by] = params[:sort_by]
    redirect_to posts_question
  end

  def delete_session
    session.delete(:last_viewed_question)
    redirect_to questions_path
  end


  def show
    @questions = Question.find(params[:id])
    session[:last_viewed_question_id] = @question.id
  end

  def new
  end

  def create
    current_user.question.create(question_params)
    @questions.save
    redirect_to @article
  end

  private
    def question_params
      params.require(:question).permit(:question, :color)
    end
end

class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def set_question
      @question = Question.new
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
    @question = Question.find(params[:id])
    # session[:last_viewed_question_id] = @question.id
    # @response = @question.response.build
  end

  def new
    @question = Question.new
  end

  def edit
    @question = Question.find(params[:id])
  end

  def index
    authenticate_user!
    # @last_viewed_question = Question.find(session[:last_viewed_question_id])
    @questions = Question.all.order(session[:sort_by])
      if current_user
        @questions = current_user.questions
      else
        @questions = Question.all
      end
    end

  def create
    @question = current_user.questions.build(question_params)
    if @question.save
      redirect_to @question
    else
      render 'new'
    end
  end

  def update
    @question = Question.find(params[:id])
    if @question.update(question_params)
      redirect_to @question
    else
      render 'edit'
    end
  end

  def destroy
  @question = Question.find(params[:id])
  @question.destroy
  redirect_to @question
end

  private
    def question_params
      params.require(:question).permit(:body)
    end
end

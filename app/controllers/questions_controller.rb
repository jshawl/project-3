class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def set_question
      @question = Question.new
  end

  def sort
    session[:sort_by] = params[:sort_by]
    redirect_to questions_path
  end

  def delete_session
    session.delete(:last_viewed_question)
    redirect_to questions_path
  end

  def index
    # authenticate_user!
    # @last_viewed_question = Question.find(session[:last_viewed_question_id])
    @questions = Question.all.order(session[:sort_by])
      if current_user
        @questions = current_user.questions
        @questions = Question.all # remove this line
      else
        @questions = Question.all
      end
    end

  def new
    @question = Question.new
  end

  def edit
    @question = Question.find(params[:id])
  end

  def create
    @question = current_user.questions.build(question_params)
    # what is the difference between .build and .new and .create?
    if @question.save
      redirect_to @question
    else
      render 'new'
    end
  end

  def show
    @question = Question.find(params[:id])
    # session[:last_viewed_question_id] = @question.id
    # @response = @question.response.build
    @color = @question.responses.build
    respond_to do |format|
      format.html
      format.css
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
    # can you think of a way to restrict deletion to the user who created
    # the question?
    redirect_to @question
  end

  private
    def question_params
      params.require(:question).permit(:body, :color)
    end
end

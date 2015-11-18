class AnswersController < ApplicationController
  def set_answer
    @answer = Answer.new
  end

  def create
      @question = Question.find(params[:question_id])
      @answer = @question.answers.create(answer_params)
      redirect_to question_path(@question)
    end

  def edit
    @answer = Answer.find(params[:id])
  end

  # def update
  #   @question = Question.find(params[:id])
  #   if @question.update(question_params)
  #     redirect_to @question
  #   else
  #     render 'edit'
  #   end
  # end

  def destroy
    @question = Question.find(params[:quetion_id])
    @answer = @question.answers.find(params[:id])
    @answer.destroy
    redirect_to question_path(@question)
  end

    private
      def answer_params
        params.require(:answer).permit(:text)
      end
  end

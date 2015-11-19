class ResponseController < ApplicationController

  def set_respone
    @response = Response.new
  end

  # def set_color
  #   @color = Response.new
  # end

  def create
    @question = Question.find(params[:question_id])
    @response = @question.responses.create(answer_params)
    redirect_to question_path(@question)
  end

  def show
    @response = Response.find(params[:id])
    # session[:last_viewed_question_id] = @question.id
    # @response = @question.response.build
    @color = response.color.build
  end

  private
    def response_params
      params.require(:response).permit(:color)
    end

end

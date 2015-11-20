class ResponseController < ApplicationController

  def set_respone
    @response = Response.new
  end

  def sort
    session[:sort_by] = params[:sort_by]
    redirect_to responses_path
  end

  # def delete_session
  #   session.delete(:last_viewed_question)
  #   redirect_to responses_path
  # end

  def index
    # authenticate_user!
    # @last_viewed_question = Question.find(session[:last_viewed_question_id])
    @responses = Response.all.order(session[:sort_by])
      if current_user
        @responses = current_user.responses
      else
        @responses = Response.all
      end
    end

  def new
    @response = Response. new
  end

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
    respond_to do |format|
        format.html
        format.css
      end
  end

  def update
    @response = Response.find(params[:id])
    if @response.update(response_params)
      redirect_to @question
    else
      render 'edit'
    end
  end

  def destroy
  @response = Response.find(params[:id])
  @response.destroy
  redirect_to @question
end

  private
    def response_params
      params.require(:response).permit(:color, :user, :question)
    end

end

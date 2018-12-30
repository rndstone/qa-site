class QuestionerResponsesController < ApplicationController
  def new
    @answer = Answer.find(params[ansewer_id])
    @questioner_response = QuestionerResponse.new
  end

  def create
    @questioner_response = @answer.questioner_response.create(questioner_response_params)
  end

  def edit
  end

  def destroy
  end
  
  private
  
  def questioner_response_params
    params.require(:questioner_response).permit(:content)
  end
end

# frozen_string_literal: true

# Answers Controller class
class AnswersController < ApplicationController
  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.create(answer_params)
    redirect_to question_path(@question)
  end

  def destroy
    @answer = Answer.find(params[:id])
    @answer.destroy
    respond_to do |format|
      format.html { redirect_to question_path(@question) }
      format.js   { render layout: false }
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:description, :question_id, :user_id)
  end
end

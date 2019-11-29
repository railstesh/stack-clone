# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AnswersController, type: :controller do
  # let!(:user) { FactoryBot.create(:user) }
  let!(:question) { FactoryBot.create(:question) }
  let!(:answer) { { description: 'aaaaa', user_id: question.user.id, question_id: question.id } }

  xdescribe 'POST #create' do
    context 'with valid params' do
      xit 'creates a new Answer' do
        expect do
          question.reload
          post :create, params: { answer: answer }
        end.to change(Answer, :count).by(1)
      end

      it 'redirects to the created question' do
        post :create, params: { answer: answer }
        expect(response).to redirect_to(question)
      end
    end
  end

  xdescribe 'DELETE #destroy' do
    it 'destroys the requested answer' do
      question = FactoryBot.create(:question)
      answer_attributes = { description: 'abcde', user_id: question.user.id, question_id: question.id }
      answer = Answer.create! answer_attributes
      expect do
        delete :destroy, params: { id: answer.id }
      end.to change(Question, :count).by(-1)
    end

    it 'redirects to the question' do
      answer = Answer.create! answer
      delete :destroy, params: { id: answer.to_param }
      expect(response).to redirect_to(questions_url)
    end
  end
end

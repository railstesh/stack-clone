# frozen_string_literal: true

require 'rails_helper'

RSpec.describe QuestionsController, type: :controller do
  let!(:user) { FactoryBot.create(:user) }
  let!(:valid_attributes) { { title: 'aaaaa', description: 'aaaaa', user_id: user.id } }
  let!(:invalid_attributes) { { title: 'aa', description: 'aaaaa', user_id: user.id } }
  let!(:new_attributes) { { title: 'aaaaa2', description: 'aaaaa2', user_id: user.id } }

  describe 'GET #index' do
    it 'render :index' do
      get :index
      expect render_template(:index)
    end

    it 'should respond with 200' do
      get :index
      expect response.status == 200
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      question = Question.create! valid_attributes
      get :show, params: { id: question.to_param }
      expect(response).to be_successful
    end
  end

  describe '#new' do
    let(:action_response) { get(:new) }
    subject { action_response }

    before do
      action_response
    end

    context 'question' do
      it { should_not.nil? }
    end
  end

  describe 'GET #edit' do
    it 'returns a success response' do
      question = Question.create! valid_attributes
      get :edit, params: { id: question.to_param }
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Question' do
        expect do
          post :create, params: { question: valid_attributes }
        end.to change(Question, :count).by(1)
      end

      it 'redirects to the created question' do
        post :create, params: { question: valid_attributes }
        expect(response).to redirect_to(Question.last)
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      it 'updates the requested question' do
        question = Question.create! valid_attributes
        put :update, params: { id: question.to_param, question: new_attributes }
        question.reload
      end

      it 'redirects to the question' do
        question = Question.create! valid_attributes
        put :update, params: { id: question.to_param, question: valid_attributes }
        expect(response).to redirect_to(question)
      end
    end

    context 'with invalid params' do
      it "returns a success response (i.e. to display the 'edit' template)" do
        question = Question.create! valid_attributes
        put :update, params: { id: question.to_param, question: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested question' do
      question = Question.create! valid_attributes
      expect do
        delete :destroy, params: { id: question.to_param }
      end.to change(Question, :count).by(-1)
    end

    it 'redirects to the questions list' do
      question = Question.create! valid_attributes
      delete :destroy, params: { id: question.to_param }
      expect(response).to redirect_to(questions_url)
    end
  end
end

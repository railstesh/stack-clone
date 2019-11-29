# frozen_string_literal: true

require 'rails_helper'

describe 'new question', type: :feature, js: true do
  let(:user) { FactoryBot.create(:user) }
  let!(:question) { FactoryBot.create(:question) }

  before do
    login_as(user, scope: :user)
  end

  context 'when user try to create a new question' do
    it 'they see a new question form' do
      visit '/questions/new'
      question = FactoryBot.create(:question)
      fill_in 'Title', with: question.title
      fill_in 'Description', with: question.description
      click_button 'Create Question'

      expect(page).to have_text 'Question was successfully created.'
    end
  end

  context 'when user try to see a question' do
    it 'they see a question and its answers' do
      visit '/questions'
      click_link 'Show'
      expect(page).to have_link 'Back'
    end
  end

  context 'when user try to update a question' do
    it 'they should see a form' do
      visit "/questions/#{question.id}/edit"
      expect(page).to have_text 'Editing question'
    end
  end

  context 'when user try to delete a question' do
    it 'they see a successfull message' do
      visit '/questions'
      accept_confirm do
        click_link 'Delete'
      end
      expect(page).to have_text 'Question was successfully destroyed.'
    end
  end
end

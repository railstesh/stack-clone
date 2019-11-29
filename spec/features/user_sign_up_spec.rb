# frozen_string_literal: true

require 'rails_helper'

describe 'user register page', type: :feature, js: true do
  context 'when user try to register' do
    it 'they see sign up page' do
      visit '/users/sign_up'
      fill_in 'Email', with: "test#{rand(100)}@example.com"
      fill_in 'Password', with: '123456'
      fill_in 'Password confirmation', with: '123456'
      click_button 'Sign up'

      expect(page).to have_text 'Welcome! You have signed up successfully.'
    end
  end
end

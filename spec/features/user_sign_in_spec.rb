# frozen_string_literal: true

require 'rails_helper'

describe 'user login page', type: :feature, js: true do
  context 'when user try to login' do
    it 'they see login page' do
      visit '/users/sign_in'
      user = FactoryBot.create(:user)
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Log in'

      expect(page).to have_text 'Signed in successfully.'
    end
  end
end

# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'fields' do
    it { should have_db_column(:email).of_type(:string) }
    it { should have_db_column(:updated_at).of_type(:datetime) }
    it { should have_db_column(:created_at).of_type(:datetime) }

    describe 'devise fields' do
      it { should have_db_column(:encrypted_password).of_type(:string) }
      it { should have_db_column(:reset_password_token).of_type(:string) }
      it { should have_db_column(:reset_password_sent_at).of_type(:datetime) }
      it { should have_db_column(:remember_created_at).of_type(:datetime) }
    end
  end

  describe 'associations' do
    it { should have_many(:questions) }
    it { should have_many(:answers) }
  end
end

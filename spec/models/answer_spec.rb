# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Answer, type: :model do
  describe 'fields' do
    it { should have_db_column(:description).of_type(:text) }
    it { should have_db_column(:question_id).of_type(:integer) }
    it { should have_db_column(:user_id).of_type(:integer) }
    it { should have_db_column(:updated_at).of_type(:datetime) }
    it { should have_db_column(:created_at).of_type(:datetime) }
  end

  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:question) }
  end
end

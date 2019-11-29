# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'answers/new', type: :view do
  before(:each) do
    assign(:answer, Answer.new(
                      description: 'MyText',
                      question: nil,
                      user: nil
                    ))
  end

  it 'renders new answer form' do
    render

    assert_select 'form[action=?][method=?]', answers_path, 'post' do
      assert_select 'textarea[name=?]', 'answer[description]'

      assert_select 'input[name=?]', 'answer[question_id]'

      assert_select 'input[name=?]', 'answer[user_id]'
    end
  end
end

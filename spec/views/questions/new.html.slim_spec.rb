# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'questions/new', type: :view do
  before(:each) do
    assign(:question, Question.new(
                        title: 'MyString',
                        description: 'MyText',
                        user: nil
                      ))
  end

  it 'renders new question form' do
    render

    assert_select 'form[action=?][method=?]', questions_path, 'post' do
      assert_select 'input[name=?]', 'question[title]'

      assert_select 'textarea[name=?]', 'question[description]'

      assert_select 'input[name=?]', 'question[user_id]'
    end
  end
end

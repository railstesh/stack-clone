# frozen_string_literal: true

User.first_or_create!(
  email: "test1@yopmail.com",
  password: '123456',
  password_confirmation: '123456'
)
User.first_or_create!(
  email: "test2@yopmail.com",
  password: '123456',
  password_confirmation: '123456'
)

Question.create(
  title: "How to run rspec rails application tests",
  description: 'How to run rspec rails application tests',
  user_id: User.first.id
)
Question.create(
  title: "How to run rails application server",
  description: 'How to run rails application server',
  user_id: User.first.id
)

Answer.create(
  description: 'run rspec spec/',
  question_id: Question.first.id,
  user_id: User.first.id
)
Answer.create(
  description: 'run bundle exec rspec spec/',
  question_id: Question.first.id,
  user_id: User.first.id
)
Answer.create(
  description: 'run command rspec spec/ and spec name',
  question_id: Question.first.id,
  user_id: User.first.id
)

Answer.create(
  description: 'run rails server',
  question_id: Question.last.id,
  user_id: User.first.id
)
Answer.create(
  description: 'run bundle exec rails s',
  question_id: Question.last.id,
  user_id: User.first.id
)
Answer.create(
  description: 'run rails s on terminal',
  question_id: Question.last.id,
  user_id: User.first.id
)
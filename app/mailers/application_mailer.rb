# frozen_string_literal: true

# Applicatio nMailer class
class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'
end

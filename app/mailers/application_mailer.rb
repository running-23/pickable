class ApplicationMailer < ActionMailer::Base
  append_view_path 'app/views/mailers'

  default from: email_address_with_name(Rails.application.credentials.gmail[:user_name],
                                        'Pickable事務局')
  layout 'mailer'
end

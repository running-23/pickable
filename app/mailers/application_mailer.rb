class ApplicationMailer < ActionMailer::Base
  append_view_path 'app/views/mailers'

  default from: 'Pickable事務局'
  layout 'mailer'
end

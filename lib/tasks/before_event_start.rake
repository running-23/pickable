namespace :before_event_start do
  desc 'イベント開始2時間前にイベント参加者に通知を送信'
  task mail_participating_event_users: :environment do
    BeforeEventStartMailer.before_event_start.deliver_now
  end
end

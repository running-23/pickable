class PickablesController < ApplicationController
  def create
    event = Event.find(params[:event_id])
    # Welcomeのユーザーを取ってくる
    accepted_users = User.accepted
    target_users = []
    # Welocomeかつイベントの設定カテゴリーを含むユーザーを配列に入れる
    accepted_users.each do |user|
      target_users << user if user.categories.include?(event.category)
    end
    target_users.delete(current_user)
    # 開催希望人数 - 現在イベントに参加している人数 = Picableされる人数のユーザーをランダムで取得
    picked_users = target_users.sample(event.number_of_members - event.participations.length)
    # 抽出されたユーザーをイベントに参加させる
    picked_users.each do |picked_user|
      picked_user.participate(event)
    end
    PickableMailer.with(user: picked_users, event: event).report_pickable.deliver_now
    redirect_to event, success: 'Pickableを発動しました'
  end
end

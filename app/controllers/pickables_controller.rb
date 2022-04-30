class PickablesController < ApplicationController
  def create
    event = Event.find(params[:event_id])
    if event.pickable_counts.zero?
      event.update(pickable_counts: 1)
      # Welcomeのユーザーを取ってくる
      accepted_users = User.accepted
      target_users = []
      # Welocomeかつイベントの設定カテゴリーを含むユーザーを配列に入れる
      accepted_users.each do |user|
        target_users << user if user.categories.include?(event.category)
      end
      # Pickbleで抽出される前に、現在イベントに参加しているユーザーを除外
      participated_users = event.participating_users
      targeted_users = target_users - participated_users
      # 開催希望人数 - 現在イベントに参加している人数 = Picableされる人数のユーザーをランダムで取得
      picked_users = targeted_users.sample(event.number_of_members - event.participations.length)
      # 抽出されたユーザーをイベントに参加させる
      picked_users.each do |picked_user|
        picked_user.participate(event)
      end
      PickableMailer.with(user: picked_users, event: event).report_pickable.deliver_now
      redirect_to event, success: t('.success')
    else
      redirect_to event, danger: t('.fail')
    end
  rescue ActiveRecord::RecordInvalid
    redirect_to event, danger: t('.is_past')
  end
end

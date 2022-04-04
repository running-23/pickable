class PickablesController < ApplicationController
  def create
    event = Event.find(params[:event_id])
    # Welcomeのユーザーを取ってくる
    accepted_users = User.accepted
    target_users = []
    # Welocomeかつイベントの設定カテゴリーを含むユーザーを配列に入れる
    accepted_users.each do |user|
      if user.categories.include?(event.category)
        target_users << user
      end
    end
    target_users.delete(current_user)
    # 配列内でシャッフル
    shuffled_target_users = target_users.shuffle
    # 開催希望人数 - 現在イベントに参加している人数 = Picableされる人数
    # 配列の[0]番目〜[Pickableされる数]番目を取ってくる
    picked_users = shuffled_target_users.slice(0, event.number_of_members - event.participations.length)
    # 抽出されたユーザーをイベントに参加させる
    picked_users.each do |picked_user|
      picked_user.participate(event)
    end
    redirect_to event, success: 'Pickableを発動しました'
  end
end

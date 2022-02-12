class NotificationsController < ApplicationController
  
  # フォロー通知機能
  def index
    @notifications = current_user.passive_notifications.order(created_at: :DESC)
    #@notificationの中でまだ確認していない(indexに一度も遷移していない)通知のみ
    @notifications.where(checked: false).each do |notification|
      notification.update_attributes(checked: true)
    end
  end
  
  #通知を全削除
  def destroy_all
    @notifications = current_user.passive_notifications.destroy_all
    redirect_to notifications_path
  end
  
end

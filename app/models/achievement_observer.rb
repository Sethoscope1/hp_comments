class AchievementObserver < ActiveRecord::Base
  
  def update(achievement_data)
    description = achievement_data[:description]
    
    if achievement_data[:merit_object]
      sash_id = achievement_data[:merit_object].sash_id
      user = User.where(sash_id: sash_id).first
    end
    
    merit_action = Merit::Action.find achievement_data[:merit_action_id]
    controller = merit_action.target_model
    action = merit_action.action_method
    time = merit_action.created_at
      
    Notification.create(
      user: user, 
      what: description,
      where: "#{controller}##{action}",
      when: time)
    
  end
end

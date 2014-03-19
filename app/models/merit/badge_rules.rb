# Be sure to restart your server when you modify this file.
#
# +grant_on+ accepts:
# * Nothing (always grants)
# * A block which evaluates to boolean (recieves the object as parameter)
# * A block with a hash composed of methods to run on the target object with
#   expected values (+votes: 5+ for instance).
#
# +grant_on+ can have a +:to+ method name, which called over the target object
# should retrieve the object to badge (could be +:user+, +:self+, +:follower+,
# etc). If it's not defined merit will apply the badge to the user who
# triggered the action (:action_user by default). If it's :itself, it badges
# the created object (new user for instance).
#
# The :temporary option indicates that if the condition doesn't hold but the
# badge is granted, then it's removed. It's false by default (badges are kept
# forever).

module Merit
  class BadgeRules
    include Merit::BadgeRulesMethods

    def initialize
      
      grant_on 'users#create', badge: "First Steps", model_name: "user"
      
      grant_on ['comments#upvote', 'comments#downvote'], badge: 'First Vote'
      
      grant_on 'comments#downvote', badge: 'First Burn!', model_name: "user"
      
      grant_on 'comments#upvote', badge: 'Thumbs Up!', model_name: "user"
      
      grant_on 'comments#upvote', badge: 'Popular Poster', to: :user do |comment|
        sum = CommentFavorite.where(comment_id: comment.id).map { |comment_fav| comment_fav.value.to_i }.sum
        sum > 5
      end
      
      grant_on 'comments#upvote', badge: 'High Fiver!', to: :user do |comment|    
        sum = CommentFavorite.where(comment_id: comment.id).map { |comment_fav| comment_fav.value.to_i }.sum
        sum > 5
      end
      
      grant_on ['comments#upvote', 'comments#downvote'], badge: 'Controvesy!', to: :user do |comment|
       comment = CommentFavorite.where(comment_id: comment.id)
        ups = comment.select { |comment| comment.value == 1 }.count
        downs = comment.select { |comment| comment.value == -1}.count
        
        (ups > 5) && (downs > 5)
      end
      
      grant_on 'comments#create', badge: 'Thoughtful Poster', to: :user do |comment|
        comment.body.split(" ").length > 50
      end
      
      grant_on 'comments#create', badge: 'Future Novelist', to: :user do |comment|
        comment.body.split(" ").length > 200
      end
    end
  end
end

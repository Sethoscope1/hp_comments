

module Merit

  class BadgeRules
    include Merit::BadgeRulesMethods

    def initialize
      
      grant_on 'comments#create', badge: 'First Post', to: :user do |comment|
        user = comment.user
        user.comments.count == 1
      end
           
      grant_on ['comments#upvote', 'comments#downvote'], badge: 'First Vote'
      
      grant_on 'comments#downvote', badge: 'First Burn!', model_name: "user"
      
      grant_on 'comments#upvote', badge: 'Thumbs Up!', model_name: "user"
      
      grant_on 'comments#upvote', badge: 'Popular Poster', to: :user do |comment|
        sum = CommentFavorite.where(comment_id: comment.id).map { |comment_fav| comment_fav.value.to_i }.sum
        sum > 5
      end
      
      grant_on 'comments#create', badge: 'Prolific Poster', to: :user do |comment|
        user = comment.user
        user.comments.count == 5
      end
      
    #   grant_on 'comment#upvote', badge: 'High Fiver!', to: :user do |comment|
#         current_user
#         # user = comment.comment_favorites.last.user.id
# #         CommentFavorite.where(user_id: current_user.id).select{ |cf| cf.value == 1 }.length == 5   
#       end
#       
#       grant_on 'comments#downvote', badge: 'Awww, snap!!', to: :user do |comment|    
#         CommentFavorite.where(user_id: current_user.id).select{ |cf| cf.value == -1 }.length == 5  
#       end
      
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

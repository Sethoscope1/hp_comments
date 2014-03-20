# Use this hook to configure merit parameters
Merit.setup do |config|
  # Check rules on each request or in background
  config.checks_on_each_request = true

  # Define ORM. Could be :active_record (default) and :mongoid
  config.orm = :active_record

  # Add application observers to get notifications when reputation changes.
  # config.add_observer 'MyObserverClassName'

  # Define :user_model_name. This model will be used to grand badge if no
  # `:to` option is given. Default is 'User'.
  config.user_model_name = 'User'

  # Define :current_user_method. Similar to previous option. It will be used
  # to retrieve :user_model_name object if no `:to` option is given. Default
  # is "current_#{user_model_name.downcase}".
  config.current_user_method = 'current_user'
  
  config.add_observer 'AchievementObserver'
end

# Create application badges (uses https://github.com/norman/ambry)
# badge_id = 0
# [{
#   id: (badge_id = badge_id+1),
#   name: 'just-registered'
# }, {
#   id: (badge_id = badge_id+1),
#   name: 'best-unicorn',
#   custom_fields: { category: 'fantasy' }
# }].each do |attrs|
#   Merit::Badge.create! attrs
# end

[ 
  
  # {
  # id: 1,
  # name: 'First Post',
  # description: "Write your first comment!",
  # custom_fields: { image: "http://media.giphy.com/media/xNBcChLQt7s9a/giphy.gif" }
  # }, 
  
  {
    id: 11, 
    name: 'Prolific Poster', 
    description: "Write 5 Comments",
    custom_fields: { image: "http://media2.giphy.com/media/b55x0VFpFKm7S/giphy.gif"}       
  }, {
    id: 2, 
    name: "First Vote", 
    description: "Up-or-downvote a comment!",
    custom_fields: { image: "http://media.giphy.com/media/beD4xGgArcMXC/giphy.gif"}       
  }, {
    id: 3,
    name: "First Burn!", 
    description: "Downvote your first comment",
    custom_fields: { image: "http://i.imgur.com/5Jwa5.gif" }      
  }, {
    id: 4, 
    name: "Thumbs Up!",
    custom_fields: { image: "http://i3.kym-cdn.com/entries/icons/original/000/012/982/post-19715-Brent-Rambo-gif-thumbs-up-imgu-L3yP.gif"},
    description: "Upvote your first comment!"
  }, {
    id: 5, 
    name: "Popular Poster",
    custom_fields: { image: "http://www.gurl.com/wp-content/uploads/2013/06/IM-SO-POPULAR.gif"},
    description: "Write a post with a score of 5"
  }, {
    id: 6,
    name: 'Controvesy!',
    custom_fields: { image: "http://media2.giphy.com/media/BBmnomPMF2slW/giphy.gif"},
    description: "Write a post with 5 upvotes and 5 downvotes"  
  } , {
    id: 7,
    name: "High Fiver!",
    custom_fields: { image: "http://31.media.tumblr.com/tumblr_m4t4j8w2iG1qdlh1io1_400.gif"},
    description: "Give 5 Upvotes"
  }, {
    id: 8,
    name: "Awww, snap!!",
    custom_fields: { image: "http://31.media.tumblr.com/tumblr_m0dpjlWlnn1rqfhi2o1_500.gif"},
    description: "Give 5 Downvotes"  
    }, {
    id: 9,
    name: "Thoughtful Poster",
    custom_fields: { image: "http://media.giphy.com/media/6HeXJ7cIieKDC/giphy.gif"},
    description: "Write a 50 word comment"  
    }, {
    id: 10,
    name: "Future Novelist",
    custom_fields: { image: "http://media.giphy.com/media/138qDnykmEK4rm/giphy.gif"},
    description: "Write a 200 word comment"  
    }
].each do |badge_attrs|
  Merit::Badge.create!(badge_attrs)
end

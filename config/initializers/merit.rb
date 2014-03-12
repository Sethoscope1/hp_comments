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

[{
    id: 1,
    name: "First Steps",
    description: "Register for a new account",
    custom_fields: { image: "http://img.youtube.com/vi/0yp_YH3rZFw/0.jpg" }
  }, {
    id: 2, 
    name: "First Vote", 
    description: "Upvote a comment you like!",
    custom_fields: { image: "http://news.xinhuanet.com/english/2008-11/05/xin_1921105050933312147043.jpg"}       
  }, {
    id: 3,
    name: "First Burn!", 
    description: "Downvote your first comment!",
    custom_fields: { image: "#" }      
  }, {
    id: 4, 
    name: "Thumbs Up!",
    custom_fields: { image: "#"},
    description: "Upvote your first comment!"
  }, {
    id: 5, 
    name: "Popular Poster",
    custom_fields: { image: "#"},
    description: "Write a post with a score of 5"
  }, {
    id: 6,
    name: "Controversy",
    custom_fields: { image: "#"},
    description: "Write a post with 5 upvotes and 5 downvotes"  
  } , {
    id: 7,
    name: "High Fiver!",
    custom_fields: { image: "#"},
    description: "Give 5 Upvotes"
  }, {
    id: 8,
    name: "Down Low!",
    custom_fields: { image: "#"},
    description: "Give 5 Downvotes"  
    }
].each do |badge_attrs|
  Merit::Badge.create!(badge_attrs)
end

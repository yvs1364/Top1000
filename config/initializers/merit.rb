# Use this hook to configure merit parameters
Merit.setup do |config|
  # Check rules on each request or in background
  # config.checks_on_each_request = true

  # Define ORM. Could be :active_record (default) and :mongoid
  # config.orm = :active_record

  # Add application observers to get notifications when reputation changes.
  # config.add_observer 'MyObserverClassName'

  # Define :user_model_name. This model will be used to grand badge if no
  # `:to` option is given. Default is 'User'.
  # config.user_model_name = 'User'

  # Define :current_user_method. Similar to previous option. It will be used
  # to retrieve :user_model_name object if no `:to` option is given. Default
  # is "current_#{user_model_name.downcase}".
  # config.current_user_method = 'current_user'
end

# Create application badges (uses https://github.com/norman/ambry)
badge_id = 0
[{
  id: (badge_id = badge_id+1),
  name: 'Apprentice guide'
}, {
  id: (badge_id = badge_id+1),
  name: 'Guide',
}, {
  id: (badge_id = badge_id+1),
  name: 'Veteran guide',
}, {
  id: (badge_id = badge_id+1),
  name: 'Taciturn',
}, {
  id: (badge_id = badge_id+1),
  name: 'Talker',
}, {
  id: (badge_id = badge_id+1),
  name: 'Chatty',
}, {
  id: (badge_id = badge_id+1),
  name: 'Deafening',
}, {
  id: (badge_id = badge_id+1),
  name: 'Judge',
}, {
  id: (badge_id = badge_id+1),
  name: 'Critic',
}, {
  id: (badge_id = badge_id+1),
  name: 'Know-it-all',
}, {
  id: (badge_id = badge_id+1),
  name: 'Curious',
}, {
  id: (badge_id = badge_id+1),
  name: 'Wanderer',
}, {
  id: (badge_id = badge_id+1),
  name: 'Explorer',
}].each do |attrs|
  Merit::Badge.create! attrs
end

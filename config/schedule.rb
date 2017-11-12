set :environment, 'development'

every 1.day do
  rake "todo:delete_items"
end

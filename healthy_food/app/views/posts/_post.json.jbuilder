json.extract! post, :id, :description, :no_of_likes, :no_of_saved, :no_of_comments, :user_id, :comment_id, :created_at, :updated_at
json.url post_url(post, format: :json)

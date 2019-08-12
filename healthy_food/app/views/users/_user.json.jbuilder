json.extract! user, :id, :first_name, :last_name, :mobile_number, :username, :password, :email, :brithdate, :is_specialist, :weight, :height, :diseases, :gender, :recipe_id, :created_at, :updated_at
json.url user_url(user, format: :json)

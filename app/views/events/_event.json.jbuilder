json.extract! event, :id, :title, :description, :number_of_members, :number_of_applicants, :scheduled_date, :place, :pickable_mode, :user_id, :category_id, :created_at, :updated_at
json.url event_url(event, format: :json)

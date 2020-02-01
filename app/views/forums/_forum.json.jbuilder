json.extract! forum, :id, :title, :content, :subject_id, :user_id, :created_at, :updated_at
json.url forum_url(forum, format: :json)

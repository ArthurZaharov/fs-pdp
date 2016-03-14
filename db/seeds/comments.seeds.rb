after(:articles) do
  users_ids = User.pluck(:id)
  articles_ids = Article.pluck(:id)

  20.times do
    FactoryGirl.create(
      :comment,
      user_id: users_ids.sample,
      article_id: articles_ids.sample)
  end
end

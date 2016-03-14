after(:articles) do
  users_ids = User.pluck(:id)
  articles_ids = Article.pluck(:id)

  if Comment.count < 20
    20.times do
      FactoryGirl.create(
        :comment,
        user_id: users_ids.sample,
        article_id: articles_ids.sample
      )
    end
  end
end

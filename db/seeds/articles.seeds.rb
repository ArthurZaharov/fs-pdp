after(:users) do
  user_ids = User.pluck(:id)

  if Article.count < 10
    10.times { FactoryGirl.create(:article, user_id: user_ids.sample) }
  end
end

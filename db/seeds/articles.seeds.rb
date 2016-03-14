after(:users) do
  user = User.find_by_email("author@example.com")

  10.times { FactoryGirl.create(:article, user: user) }
end

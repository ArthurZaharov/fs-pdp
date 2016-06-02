after(:users) do
  user = User.find_by_email("user@example.com")

  3.times do
    user
      .subscriptions
      .create!(
        author: User.where.not(id: user.id).sample,
        expired_at: Time.zone.today + 30.days
      )
  end
end

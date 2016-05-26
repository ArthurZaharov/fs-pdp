users = [
  {
    email: "user@example.com",
    password: "123456",
    full_name: "John Doe",
    city: "New York",
    address: "291-343 Hops Ln"
  },
  {
    email: "author@example.com",
    password: "123456",
    full_name: "Arthur Zaharov",
    city: "Kazan",
    address: "Pushkina, 46",
    weekly_subscription_price: "7"
  },
  {
    email: "author1@example.com",
    password: "123456",
    full_name: "Marco Polo",
    city: "New York",
    address: "1680 Coney Island Ave",
    weekly_subscription_price: "4.99",
    monthly_subscription_price: "18"
  },
  {
    email: "author2@example.com",
    password: "123456",
    full_name: "Jonny Depp",
    city: "New York",
    address: "23 E 3rd St",
    weekly_subscription_price: "4",
    yearly_subscription_price: "150"
  },
  {
    email: "author3@example.com",
    password: "123456",
    full_name: "Angelina Jolly",
    city: "New Orleans",
    address: "11417 Campbell Ln",
    weekly_subscription_price: "14.99"
  },
  {
    email: "author4@example.com",
    password: "123456",
    full_name: "Teddy the Pohh",
    city: "New Orleans",
    address: "3704 Arkansas Ave",
    weekly_subscription_price: "2",
    monthly_subscription_price: "6"
  },
  {
    email: "author5@example.com",
    password: "123456",
    full_name: "Tod Island",
    city: "New Orleans",
    address: "1128 Tensas Dr",
    weekly_subscription_price: "0.99"
  }
]

users.each do |attrs|
  user = User.find_or_initialize_by(email: attrs[:email])
  user.confirmed_at = 1.hour.ago
  user.attributes = attrs
  user.save!
end

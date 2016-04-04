users = [
  {
    email: "user@example.com",
    password: "123456",
    full_name: "John Doe",
    city: "New York",
    address: "291-343 Hops Ln",
    confirmed_at: 1.hour.ago
  },
  {
    email: "author@example.com",
    password: "123456",
    full_name: "Arthur Zaharov",
    city: "Kazan",
    address: "Pushkina, 46",
    confirmed_at: 1.hour.ago
  },
  {
    email: "author1@example.com",
    password: "123456",
    full_name: "Marco Polo",
    city: "New York",
    address: "1680 Coney Island Ave",
    confirmed_at: 1.hour.ago
  },
  {
    email: "author2@example.com",
    password: "123456",
    full_name: "Jonny Depp",
    city: "New York",
    address: "23 E 3rd St",
    confirmed_at: 1.hour.ago
  },
  {
    email: "author3@example.com",
    password: "123456",
    full_name: "Angelina Jolly",
    city: "New Orleans",
    address: "11417 Campbell Ln",
    confirmed_at: 1.hour.ago
  },
  {
    email: "author4@example.com",
    password: "123456",
    full_name: "Teddy the Pohh",
    city: "New Orleans",
    address: "3704 Arkansas Ave",
    confirmed_at: 1.hour.ago
  },
  {
    email: "author5@example.com",
    password: "123456",
    full_name: "Tod Island",
    city: "New Orleans",
    address: "1128 Tensas Dr",
    confirmed_at: 1.hour.ago
  }
]

users.each do |attrs|
  user = User.find_or_initialize_by(email: attrs[:email])
  user.attributes = attrs
  user.save!
end

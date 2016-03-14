emails = %w(user@example.com author@example.com)

emails.each do |email|
  FactoryGirl.create(:user, email: email) unless User.find_by_email(email)
end

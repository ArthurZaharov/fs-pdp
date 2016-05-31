class SubscribeToAuthor
  include Interactor::Organizer

  organize PayForSubscription, CreateSubscription
end

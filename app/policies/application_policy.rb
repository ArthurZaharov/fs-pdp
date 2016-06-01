class ApplicationPolicy
  attr_reader :user, :object

  def initialize(user, object)
    @user = user
    @object = object.to_model
  end

  private

  def owner?
    user == object.user
  end
end

class Users::EditForm
  include ActiveModel::Model

  attr_reader :user

  delegate :attributes=, to: :user, prefix: true
  delegate :attributes=, to: :profile, prefix: true

  validate :validate_children

  def initialize(user, attributes = {})
    @user = user
    @user.build_profile unless @user.profile

    super(attributes)
  end

  def profile
    user.profile
  end

  def save
    return false if invalid?

    ActiveRecord::Base.transaction do
      user.save! && profile.save!
    end
  end

  private

    def validate_children
      if user.invalid?
        promote_errors(user.errors)
      end

      if profile.invalid?
        promote_errors(profile.errors)
      end
    end

    def promote_errors(child_errors)
      child_errors.each do |attribute, message|
        errors.add(attribute, message)
      end
    end
end

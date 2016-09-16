require 'verbal_expressions'

class CouponsDelivery
  include ActiveModel::Model

  attr_accessor :emails

  validate :emails_correctivity

  def compose
    return unless valid?

    ActiveRecord::Base.transaction do
      self.users = emails_list.map do |email|
        user = User.create!(email: email)
        user.create_coupon!

        user
      end
    end

    users.each do |user|
      NotificationsMailer.notify_user(user).deliver_now
    end
  end

  private

  attr_accessor :users

  def emails_correctivity
    incorrect_emails = emails_list.select { |email| email_matcher.match(email).blank? }

    if incorrect_emails.any?
      errors.add(:emails, "It looks like #{incorrect_emails} it is not an email(s)")
    end
  end

  def email_matcher
    VerEx.new do
      start_of_line
      anything_but ' '
      find '@'
      anything_but ' '
      find '.'
      anything_but ' '
      end_of_line
    end
  end

  def emails_list
    emails.split(',').map(&:strip)
  end
end

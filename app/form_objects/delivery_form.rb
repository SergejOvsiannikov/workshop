class DeliveryForm < Reform::Form
  property :emails
  validates :emails, presence: true
  validate :emails_correctivity

  private

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

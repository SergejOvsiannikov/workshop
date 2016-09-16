class Coupon < ActiveRecord::Base
  before_validation :generate_code
  belongs_to :user

  def generate_code
    return if code.present?

    digest = Digest::SHA1.hexdigest([Time.now, rand].join)[4..8].upcase

    if Coupon.exists?(code: digest)
      generate_code
    else
      self.code = digest
    end

    self
  end
end

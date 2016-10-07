class Profile < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader

  validates :first_name, presence: true

  def name
    "#{first_name} #{last_name}"
  end
end

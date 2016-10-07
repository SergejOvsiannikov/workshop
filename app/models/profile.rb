class Profile < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader

  def name
    "#{first_name} #{last_name}"
  end
end

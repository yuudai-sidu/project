class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
        # attachment :profile_image
       mount_uploader :profile_image, ImageUploader
         validates :name, presence: true
         has_many :projects, dependent: :destroy
end

class Project < ApplicationRecord
    belongs_to :user
    #  attachment :image
   mount_uploader :image, ImageUploader
     default_scope -> { order(created_at: :desc) }
     
     with_options presence: true do
    validates :title
    validates :body
    validates :image
    
  end
end

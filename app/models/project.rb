class Project < ApplicationRecord
    belongs_to :user
     attachment :image
     default_scope -> { order(created_at: :desc) }
     
     with_options presence: true do
    validates :title
    validates :body
    
  end
end

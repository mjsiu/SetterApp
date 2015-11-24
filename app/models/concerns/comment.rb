class Comment < ActiveRecord::Base

  validates :title, :body, presence: true
end

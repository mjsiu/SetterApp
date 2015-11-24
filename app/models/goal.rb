class Goal < ActiveRecord::Base

  validates :title, :body, :visiblity, presence: :null

  include Commentable
end

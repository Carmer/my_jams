class Song < ActiveRecord::Base
  validates :title, presence: true, uniqueness: {scope: :artist}
  validates :artist, presence: true


  belongs_to :user

end

class BlogPost < ApplicationRecord

  belongs_to :user

  validates :title, presence: true
  validates :content, presence: true
  validates :image, presence: true

  before_validation :fetch_image, no: :create
  before_update :fetch_image
  private

  def fetch_image
    # return if image.present?

    photos = Unsplash::Photo.search(title, page = 1, per_page = 1)
    self.image = photos.first.urls.regular if photos.any?
  end

  
end

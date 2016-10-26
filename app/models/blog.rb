class Blog < ApplicationRecord
	belongs_to :admin
	default_scope -> { order(created_at: :desc) }

	has_attached_file :image, styles: {large: "1280x960>", medium: "300x300>", thumb: "150x150>" }, default_url: "/images/:style/missing.png"
  	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  	validates :image, attachment_presence: true

  	validates :title, presence: true, length: { maximum: 50 }
  	validates :description, presence: true
end

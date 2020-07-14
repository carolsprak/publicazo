class Photo < ActiveRecord::Base
  belongs_to :service

  has_attached_file :image #, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end

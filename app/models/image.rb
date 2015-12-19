class Image < ActiveRecord::Base
  if Rails.env == "production"
    has_attached_file :data,
                      :styles => {
                          :thumb  => "100x100",
                          :medium => "200x200",
                          :large => "600x400"
                      },
                      :storage => :s3,
                      :s3_permissions => :private,
                      :s3_credentials => "#{Rails.root}/config/s3.yml",
                      :path => ":attachment/:id/:style.:extension"
  else
    has_attached_file :data,
                      :styles => {
                          :thumb  => "100x100",
                          :medium => "200x200",
                          :large => "600x400"
                      },
                      :storage => :filesystem,
                      :path => ":rails_root/public/:attachment/:updated_at/:id/:style.:extension",
                      :url  => "#{ActionController::Base.relative_url_root}/:attachment/:updated_at/:id/:style.:extension"
  end
  validates_attachment_content_type :data, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  has_many :favorites

  def authenticated_image_url(style)
    if Rails.env == "production"
      data.s3_object(style).url_for(:read, :secure => true)
    else
      data.url(style)
    end
  end
end

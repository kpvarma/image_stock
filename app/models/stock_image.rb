class StockImage < ApplicationRecord

  # Attachments
  has_one_attached :image

  # Validations
  validates :identifier, :presence=> true, length: {minimum: 8, maximum: 32}, allow_blank: false, uniqueness: true
  validates :title, allow_blank: true, length: {minimum: 3, maximum: 256}

  validate  :validate_attachment

  def validate_attachment
    errors[:image] << "can't be blank" unless image.attached?
    if image.attached? && image.blob
      if !image.blob.content_type.starts_with?('image/')
        image.purge
        errors[:image] << 'Wrong format. Attachment must be of image/jpg'
      end
      # if image.blob.byte_size > 1000000
      #   image.purge
      #   errors[:base] << 'Too big'
      # end
    end
  end

  # Callbacks
  # before_validation :generate_identifier, on: :create

  def generate_identifier
    self.identifier = SecureRandom.hex(4) unless self.identifier
  end

end

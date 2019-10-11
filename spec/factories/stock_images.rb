FactoryBot.define do
  factory :stock_image do
    title { "Sample Image" }
    image { fixture_file_upload(Rails.root.join('spec', 'support', 'assets', 'test-image.jpeg'), 'image/jpeg') }
  end

  after :build do |si|
    si.generate_identifier
  end
end

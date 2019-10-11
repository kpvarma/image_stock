require 'rails_helper'

RSpec.describe StockImage, type: :model do

  context "Factory" do
    it "should validate all the factories" do
      expect(FactoryBot.build(:stock_image).valid?).to be true
    end
  end

  context "Validations" do
    it { should validate_presence_of :identifier }
    it { should validate_uniqueness_of :identifier }
    it { should_not allow_value(nil).for(:identifier )}
    it { should_not allow_value("x"*7).for(:identifier )}
    it { should_not allow_value("x"*33).for(:identifier )}

    it { should allow_value(nil).for(:title )}
    it { should_not allow_value("x"*2).for(:title )}
    it { should_not allow_value("x"*257).for(:title )}

    it "should generate the identifier" do
      simg = FactoryBot.build(:stock_image)
      simg.identifier = nil
      expect(simg.valid?).to be_falsy

      simg.generate_identifier
      expect(simg.valid?).to be_truthy
      expect(simg.identifier).not_to be_blank
    end

    it "should validate the presense of image" do
      simg = FactoryBot.build(:stock_image)
      simg.image.detach
      expect(simg.valid?).to be_falsy
    end

    it "should validate the image filetype" do
      simg = FactoryBot.build(:stock_image)
      simg.image = Rack::Test::UploadedFile.new(Rails.root.join("spec/support/assets/test-document.pdf"))
      expect(simg.valid?).to be_falsy
      expect(simg.errors[:image]).to match_array(["can't be blank"])
    end
  end

end

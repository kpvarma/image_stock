require "rails_helper"

RSpec.describe StockImagesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/stock_images").to route_to("stock_images#index")
    end

    it "routes to #show" do
      expect(:get => "/stock_images/1").to route_to("stock_images#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/stock_images").to route_to("stock_images#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/stock_images/1").to route_to("stock_images#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/stock_images/1").to route_to("stock_images#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/stock_images/1").to route_to("stock_images#destroy", :id => "1")
    end
  end
end

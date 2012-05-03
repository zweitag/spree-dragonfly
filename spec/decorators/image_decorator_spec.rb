# encoding: utf-8
require 'spec_helper'

describe "Upload a file with dragonfly" do
  it "should create an Spree::Image file" do
    count = Spree::Image.count
    
    image = Spree::Image.new
    image.attachment = File.new("#{File.dirname(__FILE__)}/../files/trollface.jpg")
    image.should be_valid
    image.save.should be true

    Spree::Image.count.should == (count + 1)

    image.id.should_not be nil
    image.attachment_uid.should_not be nil
    image.attachment_uid.include?('trollface.jpg').should be true
    image.attachment_image_name.should == 'trollface.jpg' 
  end
  
  it "should fail with validation errors" do
    image = Spree::Image.new
    image.attachment = File.new("#{File.dirname(__FILE__)}/../files/troll-face-high-resolution.png")
    image.should_not be_valid
    image.save.should be false
  end
end

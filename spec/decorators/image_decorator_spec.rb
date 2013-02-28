# encoding: utf-8
require 'spec_helper'

describe "Upload a file with dragonfly" do
  let(:image) do
    Spree::Image.new.tap do |image|
      image.attachment = File.new("#{File.dirname(__FILE__)}/../files/trollface.jpg")
    end
  end

  it 'creates valid images' do
    image.should be_valid
  end

  it 'can save images' do
    image.save.should be true
  end

  it 'actually creates a image row in the database' do
    count = Spree::Image.count
    image.save.should be true
    Spree::Image.count.should == (count + 1)
  end

  it "should create a Spree::Image file" do
    image.save

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

# Spree Dragonfly Extension

Exchange paperclip with dragonfly for image processing in Spree.

## Installation

Add the spree_dragonfly gem to your bundler Gemfile:

	gem 'spree_dragonfly'

From your spree rails root path:
	
	rails generate spree_dragonfly:install

Customize the dragonfly initializer in `config/initializers/dragonfly.rb` if necessary.

Include this code in your application.rb:

	config.middleware.insert 0, 'Rack::Cache', {
		:verbose     => true,
  		:metastore   => URI.encode("file:#{Rails.root}/tmp/dragonfly/cache/meta"),
  		:entitystore => URI.encode("file:#{Rails.root}/tmp/dragonfly/cache/body")
	}
	config.middleware.insert_after 'Rack::Cache', 'Dragonfly::Middleware', :images

## Usage

If you want to keep using the default image sizes as defined in Spree (with paperclip), you can use:

	image.attachment.mini.url
	image.attachment.small.url
	image.attachment.product.url
	image.attachment.large.url
	
If you want to use custom thumbnail sizes in your views as custom in dragonfly, you can use any valid dragonfly image processing method. For example:

	image.attachment.process(:greyscale).process(:thumb, '40x20#').encode(:gif).url
	
To apply your own thumbnail sizes to existing views in spree, use deface overrides or override the whole template view file or partial. Example deface override:

	Deface::Override.new(:virtual_path => "spree/products/_image", 
                     	 :name => "products_image",
                         :replace => "code[erb-loud]:contains('image_tag image.attachment.product.url, :itemprop => \"description\"')", 
                         :text => "<%= image_tag image.attachment.process(:thumb, '400x400>').url, :itemprop => \"description\"') %>")

To implement image attachment validations, create a image_decorator.rb file in app/models of your spree rails app:

	Spree::Image.class_eval do
  		validates_size_of :attachment, maximum: 500.kilobytes
		# add more...
	end
 
Copyright (c) 2012 Zweitag GmbH, released under the New BSD License

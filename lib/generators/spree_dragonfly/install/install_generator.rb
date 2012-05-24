module SpreeDragonfly
  module Generators
    class InstallGenerator < Rails::Generators::Base
      def create_initializer_file
        initializer_code = <<-code
require 'dragonfly'

app = Dragonfly[:images]
app.configure_with(:imagemagick)
app.configure_with(:rails)

app.define_macro(ActiveRecord::Base, :image_accessor)

# Spree image size defaults
image_styles = ActiveSupport::JSON.decode Spree::Config[:attachment_styles]

app.configure do |c|
  image_styles.each do |style_name, style_definition|
    # By default the styles :mini, :small, :product and :large are included in the Spree config
    c.job style_name do
      process :thumb, style_definition
    end
  end
end
code

        create_file "config/initializers/dragonfly.rb", initializer_code
      end


      desc "Copies the dragonfly image model to the app's app/models folder"

      source_root File.expand_path('../../templates/', __FILE__)

      def copy_dragonfly_image_model
        copy_file 'dragonfly_image.rb', 'app/models/dragonfly_image.rb'
      end

      def add_migrations
        run 'bundle exec rake railties:install:migrations FROM=spree_dragonfly'
      end

      def run_migrations
         res = ask "Would you like to run the migrations now? [Y/n]"
         if res == "" || res.downcase == "y"
           run 'bundle exec rake db:migrate'
         else
           puts "Skiping rake db:migrate, don't forget to run it!"
         end
      end
    end
  end
end

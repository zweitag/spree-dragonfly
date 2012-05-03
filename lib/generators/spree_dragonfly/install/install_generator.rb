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
app.configure do |c|
  c.job :mini do
    process :thumb, '48x48>'
  end
  c.job :small do
    process :thumb, '100x100>'
  end
  c.job :product do
    process :thumb, '240x240>'
  end
  c.job :large do
    process :thumb, '600x600>'
  end
end
code

        create_file "config/initializers/dragonfly.rb", initializer_code
      end

      def add_javascripts
        append_file "app/assets/javascripts/store/all.js", "//= require store/spree_dragonfly\n"
        append_file "app/assets/javascripts/admin/all.js", "//= require admin/spree_dragonfly\n"
      end

      def add_stylesheets
        inject_into_file "app/assets/stylesheets/store/all.css", " *= require store/spree_dragonfly\n", :before => /\*\//, :verbose => true
        inject_into_file "app/assets/stylesheets/admin/all.css", " *= require admin/spree_dragonfly\n", :before => /\*\//, :verbose => true
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
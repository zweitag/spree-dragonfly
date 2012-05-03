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

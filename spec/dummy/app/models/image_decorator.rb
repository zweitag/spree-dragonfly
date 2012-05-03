Spree::Image.class_eval do
  validates_size_of :attachment, maximum: 250.kilobytes
end

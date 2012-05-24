# encoding: utf-8
Spree::Variant.class_eval do
  has_many :images, class_name: 'DragonflyImage', as: :viewable, order: :position, dependent: :destroy
end
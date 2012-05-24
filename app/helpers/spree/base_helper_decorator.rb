Spree::BaseHelper.class_eval do
  # Returns style of image or nil
  # These methods are called by the overriden method missing in Spree::BaseHelper
  def image_style_from_method_name(method_name)
    if style = method_name.to_s.sub(/_image$/, '')
      possible_styles = Dragonfly[:images].job_definitions.definition_names
      style if style.to_sym.in? possible_styles
    end
  end

  def define_image_method(style)
    self.class.send :define_method, "#{style}_image" do |product, *options|
      options = options.first || {}
      if product.images.empty?
        image_tag "noimage/#{style}.png", options
      else
        image = product.images.first
        options.reverse_merge! :alt => image.alt.blank? ? product.name : image.alt
        image_tag image.attachment.send(style).url, options
      end
    end
  end

  # For version 1.1.0
  Dragonfly[:images].job_definitions.definition_names.each do |style|
    # Defines these methods by default:
    # def mini_image
    # def small_image
    # def product_image
    # def large_image
    define_method "#{style}_image" do |product, *options|
      options = options.first || {}
      if product.images.empty?
        image_tag "noimage/#{style}.png", options
      else
        image = product.images.first
        options.reverse_merge! :alt => image.alt.blank? ? product.name : image.alt
        image_tag image.attachment.send(style).url, options
      end
    end
  end

end

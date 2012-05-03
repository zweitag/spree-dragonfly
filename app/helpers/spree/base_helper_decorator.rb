Spree::BaseHelper.class_eval do  
  Spree::Image.attachment_definitions[:attachment][:styles].each do |style, v|
    define_method "#{style}_image" do |product, *options|
      options = options.first || {}
      if product.images.empty?
        image_tag "noimage/#{style}.png", options
      else
        image = product.images.first
        options.reverse_merge! :alt => image.alt.blank? ? product.name : image.alt
        image_tag image.attachment.send(style.to_sym).url, options
      end
    end
  end
end

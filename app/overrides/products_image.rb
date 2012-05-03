Deface::Override.new(:virtual_path => "spree/products/_image", 
                     :name => "products_image",
                     :replace => "code[erb-loud]:contains('image_tag image.attachment.url(:product), :itemprop => \"description\"')", 
                     :text => "<%= image_tag image.attachment.product.url, :itemprop => \"description\" %>")
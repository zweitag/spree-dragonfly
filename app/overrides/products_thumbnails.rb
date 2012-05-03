Deface::Override.new(:virtual_path => "spree/products/_thumbnails", 
                     :name => "product_thumbnails", 
                     :replace => "code[erb-loud]:contains('link_to image_tag(i.attachment.url(:mini)), i.attachment.url(:product)')", 
                     :text => "<%= link_to image_tag(i.attachment.mini.url), i.attachment.product.url %>")
Deface::Override.new(:virtual_path => "spree/admin/images/edit", 
                     :name => "admin_product_images_edit",
                     :replace => "code[erb-loud]:contains('link_to image_tag(@image.attachment.url(:mini)), @image.attachment.url(:product)')", 
                     :text => "<%= link_to image_tag(@image.attachment.mini.url), @image.attachment.product.url %>")
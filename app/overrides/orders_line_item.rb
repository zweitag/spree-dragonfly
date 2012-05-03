Deface::Override.new(:virtual_path => "spree/orders/_line_item", 
                     :name => "orders_line_item",
                     :replace => "code[erb-loud]:contains('link_to image_tag(variant.images.first.attachment.url(:small)), variant.product')", 
                     :text => "<%= link_to image_tag(variant.images.first.attachment.small.url), variant.product %>")
Deface::Override.new(:virtual_path => "spree/shared/_order_details", 
                     :name => "shared_order_details",
                     :replace => "code[erb-loud]:contains('link_to image_tag(item.variant.images.first.attachment.url(:small)), item.variant.product')", 
                     :text => "<%= link_to image_tag(item.variant.images.first.attachment.small.url), item.variant.product %>")
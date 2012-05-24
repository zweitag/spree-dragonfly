class DragonflyImage < Spree::Asset
  attr_accessible :alt, :attachment, :position, :viewable_id
  image_accessor :attachment do
    after_assign {|attachment| find_dimensions }
  end

  def find_dimensions
    if self.attachment
      self.attachment_width  = self.attachment.width
      self.attachment_height = self.attachment.height
      self.attachment_image_name = self.attachment.name
    end
  end

  #used by admin products autocomplete
  def mini_url
    attachment.mini.url
  end
end
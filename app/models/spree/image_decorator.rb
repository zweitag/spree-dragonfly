require 'dragonfly'

Spree::Image.class_eval do
  image_accessor :attachment do
    after_assign {|attachment| find_dimensions }
  end
  validate :no_attachment_errors

  def find_dimensions
    if self.attachment
      self.attachment_width  = self.attachment.width
      self.attachment_height = self.attachment.height
      self.attachment_image_name = self.attachment.name
    end
  end

  # used by admin products autocomplete.
  def mini_url
    attachment.mini.url
  end

  # Paperclip callback overrides.
  def save_attached_files; end
  def prepare_for_destroy; end
  def destroy_attached_files; end

  private
  # Required by spree/paperclip implementation.
  def no_attachment_errors
    self.errors.empty?
  end
end

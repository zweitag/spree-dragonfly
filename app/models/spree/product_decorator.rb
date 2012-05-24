Spree::Product.class_eval do
  def variant_images
    DragonflyImage.find_by_sql("SELECT #{Spree::Asset.quoted_table_name}.* FROM #{Spree::Asset.quoted_table_name} LEFT JOIN #{Spree::Variant.quoted_table_name} ON (#{Spree::Variant.quoted_table_name}.id = #{Spree::Asset.quoted_table_name}.viewable_id) WHERE (#{Spree::Variant.quoted_table_name}.product_id = #{self.id}) ORDER BY #{Spree::Asset.quoted_table_name}.position")
  end
end

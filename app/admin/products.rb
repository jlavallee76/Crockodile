ActiveAdmin.register Product do
  permit_params :name, :category_id, :description, :price, :image,
                :dairy_free, :gluten_free, :kosher,
                :peanut_free, :vegan, :vegetarian,
                :available, :featured

  form do |f|
    f.semantic_errors
    f.inputs
    f.inputs do
      f.input :image, as: :file, hint: f.object.image.present? ? image_tag(f.object.image) : ""
    end
    f.actions
  end
end

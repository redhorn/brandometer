module BrandsHelper

  def logotype_for(brand, options = {})
    image_tag("logotypes/#{brand.uid}_logotype.png", options)
  end

  def tag_cloud_for(brand)
    # Put all unique tags in a hash and count them individually
    tags = {}
    brand.tags.shuffle.each do |t|
      key = t.value
      unless tags.include?(key)
        tags[key] = 1 unless key.empty?
      else
        tags[key] += 1
      end
    end
    # Create tag cloud markup
    content_tag(:div, create_cloud(tags), class: "tag-cloud").html_safe
  end

  def create_cloud(tags)
    cloud = ''
    tags.each do |key, value|
      cloud += content_tag(:span, key, style: "font-size: #{( 1 + (value - 1) * 0.4 )}em")
    end
    cloud.html_safe
  end

end

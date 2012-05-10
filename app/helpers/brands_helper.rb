module BrandsHelper

  def logotype_for(brand, options = {})
    image_tag("logotypes/#{brand.uid}_logotype.png", options)
  end

  def tag_cloud_for(brand)
    # Put all unique tags in a hash and count them individually
    tags = {}
    brand.tags.each do |t|
      key = t.value
      unless tags.include?(key)
        tags[key] = 1 unless key.empty?
      else
        tags[key] += 1
      end
    end

    # Convert tags hash to array and sort it on tag counts
    tags = tags.to_a.sort { |a, b| a[1] <=> b[1] }

    # Create tag cloud markup from a center weighted array
    content_tag(:div, create_cloud(center_weight(tags)), class: "tag-cloud").html_safe
  end

  def create_cloud(tags)
    cloud = ''
    tags.each do |key, value|
      cloud += content_tag(:span, key, style: "font-size: #{( 1 + (value - 1) * 0.4 )}em")
    end
    cloud.html_safe
  end

  # Takes an array (sorted from lowest to highest), and rearranges it to have the largest
  # value in the center and the rest going down to the right and left.
  # Example: [0, 1, 2, 3, 4, 5, 6] --> [1, 3, 5, 6, 4, 2, 0]
  def center_weight(a)
    wa = []

    i = left = 0
    right = a.length - 1

    a.each do |item|
      if i.even?
        wa[right] = item
        right = right - 1
      else
        wa[left] = item
        left = left + 1
      end

      i = i + 1
    end

    return wa
  end

end

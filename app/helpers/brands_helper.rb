module BrandsHelper

  def logotype_for(brand, options = {})
    image_tag("logotypes/#{brand.uid}_logotype.png", options)
  end

end

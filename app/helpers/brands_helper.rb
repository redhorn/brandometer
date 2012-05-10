module BrandsHelper

  def logotype_for(brand)
    image_tag("logotypes/#{brand.uid}_logotype.png")
  end

end

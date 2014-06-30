module ApplicationHelper

  def insert_bottle_caps(avg_rating)

    html = ""

    avg_rating.to_i.times do
      html = html + image_tag("BottleCap.png", width: 25, height: 25)
    end

    remainder = avg_rating.round(1) - avg_rating.to_i.to_f
    html = html + image_tag("BottleCap.png", width: 25, height: 25, style: "position:absolute;clip:rect(0px,#{ (remainder * 25 ).to_i }px,25px,0px);")

    html
  end


end

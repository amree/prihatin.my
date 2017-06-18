class CampaignUrlConstrainer
  def matches?(request)
    slug = request.path_parameters[:id]

    Campaign.find_by(slug: slug)
  end
end

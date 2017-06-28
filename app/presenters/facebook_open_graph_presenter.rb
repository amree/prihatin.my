class FacebookOpenGraphPresenter < SimpleDelegator
  def type
    "article"
  end

  def title
    campaign.title
  end

  def description
    campaign.description
  end

  def image_url
    "http://lorempixel.com/400/200/"
  end

  private

  def campaign
    __getobj__
  end
end

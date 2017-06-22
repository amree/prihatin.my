module PresenterCollection
  def wrap(collection)
    collection.map do |obj|
      new(obj)
    end
  end
end

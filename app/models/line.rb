class Line < ApplicationRecord
  def self.search(term)
    where('LOWER(code) LIKE :term OR LOWER(itinerary) LIKE :term', term: "%#{term.downcase}%")
  end
end

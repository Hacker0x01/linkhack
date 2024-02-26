require 'uri'

class Link < ActiveRecord::Base
  validates :shortlink, presence: true, uniqueness: true
  validates :url, url: true

  def self.search(query)
    if query.present?
      Link.where('shortlink like :query OR description like :query OR url like :query', query: "%#{query}%").all
    else
      Link.all
    end
  end

  def self.levenshtein_distances(query)
    links = where(type: nil)
    links.map do |link|
      OpenStruct.new link: link, distance: Text::Levenshtein.distance(link.shortlink, query)
    end
  end

  def url_for(path)
    args = path.split('/', 2).second

    target_url = url

    target_url += argsstr.sub('%s', args) if argsstr.present? && args

    target_url
  end
end

# == Schema Information
#
# Table name: links
#
#  id          :integer          not null, primary key
#  shortlink   :string
#  url         :string
#  argsstr     :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  description :text
#  type        :text
#

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def redirector
    fullpath = request.fullpath[1..-1]

    short, args = fullpath.split('/', 2).reject(&:empty?)

    link = Link.find_by_shortlink(short)
    link ||= RegexLink.all.find { |regex_link| regex_link.matches_path? fullpath }

    unless link.present?
      relevant_links = Link
        .levenshtein_distances(short)
        .sort_by(&:distance)
      if relevant_links.first.present? && relevant_links.first.distance < 2
        link = relevant_links.first.link
      end
    end

    if link.present?
      redirect_to link.url_for fullpath
    else
      redirect_to(
        controller: :links,
        action: :new,
        link: {
          shortlink: short,
          argsstr: args
        }
      )
    end
  end
end

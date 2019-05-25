class AcquireTitleJob < ApplicationJob

  queue_as :default

  def perform(short_url)
    page = Mechanize.new.get(short_url.url)
    short_url.title = page.title
    short_url.save!
  end
end

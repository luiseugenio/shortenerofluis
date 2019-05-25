class ShortUrl < ApplicationRecord
	validates :url, presence: true, uniqueness: true, http_url: true

	after_save :shorten

	def shorten
		shortened_url = self.id.to_s(36)
		update_column(:shortened_url, shortened_url)
		shortened_url
	end

	def unshorten
		self.shortened_url.to_i(36)
	end

	def visit
		self.increment!(:visit_count)
		self.url
	end

end

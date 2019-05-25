require 'rails_helper'

RSpec.describe ShortUrl, type: :model do
	
	it "has a valid factory" do
    expect(FactoryBot.build(:short_url).save).to be true
  end

  context "validates" do
		it "presence of url " do
			should validate_presence_of(:url)
		end
  	it "uniqueness of url" do
  		should validate_uniqueness_of(:url)
  	end
  end

  context "is invalid" do
	  it "without a url" do
	  	expect(FactoryBot.build(:short_url, url: nil).save).to be false
	  end

    it "without a unique url" do
	    shortened = FactoryBot.create(:short_url)
    	expect(FactoryBot.build(:short_url, url: shortened.url).save).to be false
	  end
  end

  describe	"#shorten" do
  	shortened = FactoryBot.create(:short_url)

  	it "return a String Base36 of id" do
  		id_base_36 = shortened.id.to_s(36)
  		expect(shortened.shorten).to eq(id_base_36)
  	end

  end

  describe	"#unshorten" do
  	shortened = FactoryBot.create(:short_url)
  	
  	it "return a Integer Base36 of shortened_url" do
  		shortened_url_base_36 = shortened.shortened_url.to_i(36)
  		expect(shortened.unshorten).to eq(shortened_url_base_36)
  	end

  end

  describe	"#visit" do
  	shortened = FactoryBot.create(:short_url, visit_count:0)
  	
  	it "increment visit_count" do
  		shortened.visit
  		expect(shortened.visit_count).to eq(1)
  	end

  	it "return a original url" do
  		expect(shortened.visit).to eq(shortened.url)
  	end

  end

end

require "rails_helper"

RSpec.describe ShortUrl, :type => :request do

  describe "#new" do 

    it "creates a Short Url and redirects to the Short Url's show" do
      get "/short_urls/new"
      expect(response).to render_template(:new)

      post "/short_urls", :params => { :short_url => {:url => Faker::Internet.unique.url} }

      expect(response).to redirect_to(assigns(:short_url))

      follow_redirect!

      expect(response).to render_template(:show)
      expect(response.body).to include("Short url was successfully created.")
    end

    it "does not render a different template" do
      get "/short_urls/new"
      expect(response).to_not render_template(:show)
    end
    
  end

  describe "#index" do 

    it "List all Short Urls" do
      get "/"
      expect(response).to render_template(:index)
      expect(response.body).to include("Listing All Short Urls")
    end

  end

  describe "#redirect_to_url" do

    context "with valid shortened_url" do
      
      it "received a shortened URL and redirects to unshortened URL whith moved_permanently status" do 
        
        post "/short_urls", :params => { :short_url => {:url => "https://www.google.com"} }

        expect(ShortUrl.count).to eq(1)

        shortened = ShortUrl.last

        get "/#{shortened.shortened_url}"
        
        expect(response).to redirect_to(shortened.url)
        expect(response).to have_http_status(:moved_permanently)
        
        follow_redirect!
        
        expect(response).to have_http_status(:success)
      end
    end

    context "with invalid shortened_url" do

      it "received a shortened URL and render new with bad_request status" do 
        expect(ShortUrl.count).to eq(0)

        get "/a"

        expect(response).to render_template(:new)
        expect(response).to have_http_status(:bad_request)

      end
    end
    
  end

  describe "#top_100" do

    it "render the board with 100 most visit URL's" do
      get "/short_urls/top_100"
      expect(response).to render_template(:top_100)
      expect(response.body).to include("Top 100 Most Frequently Short Urls")
    end

  end

end
class ShortUrlsController < ApplicationController
  before_action :set_short_url, only: [:show]

  # GET /short_urls
  # GET /short_urls.json
  def index
    @short_urls = ShortUrl.all.order(:url)
  end

  # GET /short_urls/1
  # GET /short_urls/1.json
  def show
  end

  # GET /short_urls/new
  def new
    @short_url = ShortUrl.new
  end

  # POST /short_urls
  # POST /short_urls.json
  def create
    @short_url = ShortUrl.find_by_url(short_url_params[:url])

    @short_url = ShortUrl.new(short_url_params) if @short_url.nil?

    respond_to do |format|
      if @short_url.valid?
        @short_url.save!
        AcquireTitleJob.perform_later(@short_url)

        format.html { redirect_to @short_url, notice: 'Short url was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def redirect_to_url
    short_url = ShortUrl.find_by_shortened_url(params[:shortened_url])
    
    respond_to do |format|
      if short_url.present?
        url = short_url.visit
        format.html { redirect_to url, status: :moved_permanently }
      else
        format.html { render :new, status: :bad_request }
      end
    end
  end

  def top_100
    @short_urls = ShortUrl.all.order(visit_count: :desc).limit(100)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_short_url
      @short_url = ShortUrl.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def short_url_params
      params.require(:short_url).permit(:url)
    end
end

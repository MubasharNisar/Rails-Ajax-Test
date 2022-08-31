class UrlsController < ApplicationController
  def index
    @customers = Url.all
  end

  def add_new_url
    h = Validate::ValidateUrlService.new(params[:address]).process!
    if h
      respond_to do |format|
        urls = Url.all.order( 'urls.created_at DESC').pluck(:address)
        format.json {render json: {urls: urls} }
      end
    else
      respond_to do |format|
        format.json {render json: false}
      end
    end
  end

  private

  def url_params
    params.require(:url).permit(:first_name)
  end

end

class PagesController < ApplicationController
  def permalink
    @page = Page.find(permalink: params[:permalink])
  end

  def show
    @page = Page.find(params[:id])
  end

  # Renders the app/views/pages/ about and contact html.erb viles
  def about; end

  def contact; end
end

class Api::SearchesController < ApplicationController

  def index

    #@results = PgSearch.multisearch(params[:query]).includes(:searchable).map(&:searchable)
    @results = PgSearch.multisearch("outage").includes(:searchable).map(&:searchable)
    render :show
    #render :json => @results
  end

end

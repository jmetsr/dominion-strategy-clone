class Api::SearchesController < ApplicationController

  def index

    @results = PgSearch.multisearch(params[:query]).includes(:searchable).map(&:searchable)
    render :show
  end

end

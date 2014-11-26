class Api::SearchesController < ApplicationController

  def index

    find = params["text"]
    render :json => PgSearch.multisearch(find)
  end

end

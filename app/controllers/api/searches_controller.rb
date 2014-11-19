class Api::SearchesController < ApplicationController
  before_filter :reguire_login
  def index
    find = params["text"]
    render :json => PgSearch.multisearch(find)
  end

end

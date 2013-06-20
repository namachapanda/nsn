#encoding: utf-8

class TopController < ApplicationController
  # GET /items
  # GET /items.json
  def toppage
    # search_word = Items.decode(params[:q].to_s)
    # @top = Item.where(content: search_word)

    respond_to do |format|
      format.html # toppage.html.erb
      format.json { render json: @items }
    end
  end	

  def item
  	@search = Item.all
    # @search = Items.find_by_img('nsn')
  end
end

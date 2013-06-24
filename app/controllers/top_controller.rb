#encoding: utf-8

class TopController < ApplicationController
  # GET /items
  # GET /items.json
  def toppage
    # search_word = Items.decode(params[:q].to_s)
    # @top = Item.where(content: search_word)

     @information = Information.reorder('renew').limit(5).offset(0)

     @recommend = Item.order("RAND()").limit(5)
     @img = '<%= item.img %>'


    respond_to do |format|
      format.html # toppage.html.erb
      format.json { render json: @items }
    end
  end

  def item
  	@items = Item.all
    # @search = Items.find_by_img('nsn')
  end
end

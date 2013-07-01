#encoding: utf-8

class ItemsController < ApplicationController
  # GET /items
  # GET /items.json
  def index

  # @items = Item.freeword(params[:freeword]).category(params[:category_id]).color(params[:color_id]).low_price(params[:low_price]).high_price(params[:high_price])

   @items = Item.search(params)


    # params_category = params_color = Hash.new
    # low_price = 0
    # high_price = 2147483647

    #   if params[:category_id]
    #     params_category[:category_id] = params[:category_id]
    #   end

    #   if params[:color_id]
    #     params_color[:color_id] = params[:color_id]
    #   end


    #   unless params[:price1].blank?
    #     low_price = params[:price1]
    #   end

    #   unless params[:price2].blank?
    #     high_price = params[:price2]
    #   end

    # @freeword = '(name like ?) OR (explanation like ?)',"%#{params[:name]}%","%#{params[:name]}%"

    # @items = Item.where(@freeword).
                  # where(params_category).
                  # where(params_color).
                  # where('price >= ?',low_price ).
                  # where('price <= ?',high_price)

    # render 'index'
  end

  # GET /items/1
  # GET /items/1.json
  def show
    @item = Item.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @item }
    end
  end
end

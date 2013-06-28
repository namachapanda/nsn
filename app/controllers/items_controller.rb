#encoding: utf-8

class ItemsController < ApplicationController
  # GET /items
  # GET /items.json
  def index

      # @items = Item.category(params[:category_id])

  @items = Item.freeword(params[:freeword]).category(params[:category_id]).color(params[:color_id]).low_price(params[:low_price]).high_price(params[:high_price])

    # @items = Item.search(params[:freeword], params[:category_id], params[:color_id], params[:low_price],params[:high_price])

  #   params_category = params_color = Hash.new
  #   low_price = 0
  #   high_price = 2147483647

  #     # if params[:category_id]
  #     #   params_category[:category_id] = params[:category_id]
  #     # end

  #     # if params[:color_id]
  #     #   params_color[:color_id] = params[:color_id]
  #     # end


  #     unless params[:price1].blank?
  #       low_price = params[:price1]
  #     end

  #     unless params[:price2].blank?
  #       high_price = params[:price2]
  #     end

  #   @freeword = '(name like ?) OR (explanation like ?)',"%#{params[:name]}%","%#{params[:name]}%"

  #   @items = Item.where(
  #                     @freeword
  #               ).where(
  #                     params_category
  #               ).where(
  #                     params_color
  #               ).where(
  #                     'price >= ?',low_price
  #               ).where(
  #                     'price <= ?',high_price
  #               )

  #   render 'index'
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


# class ItemsController < ApplicationController
#   # GET /items
#   # GET /items.json
#   def index
#     @items = Item.all

#     respond_to do |format|
#       format.html # index.html.erb
#       format.json { render json: @items }
#     end
#   end

#   # GET /items/1
#   # GET /items/1.json
#   def show
#     @item = Item.find(params[:id])

#     respond_to do |format|
#       format.html # show.html.erb
#       format.json { render json: @item }
#     end
#   end

#   # GET /items/new
#   # GET /items/new.json
#   def new
#     @item = Item.new
#     @category_all = Category.all
#     @color_all = Color.all

#     respond_to do |format|
#       format.html # new.html.erb
#       format.json { render json: @item }
#     end
#   end

#   # GET /items/1/edit
#   def edit
#     @item = Item.find(params[:id])
#     @category_all = Category.all
#     @color_all = Color.all
#   end

#   # POST /items
#   # POST /items.json
#   def create
#     @item = Item.new(params[:item])

#     respond_to do |format|
#       if @item.save
#         format.html { redirect_to @item, notice: 'Item was successfully created.' }
#         format.json { render json: @item, status: :created, location: @item }
#       else
#         format.html { render action: "new" }
#         format.json { render json: @item.errors, status: :unprocessable_entity }
#       end
#     end
#   end

#   # PUT /items/1
#   # PUT /items/1.json
#   def update
#     @item = Item.find(params[:id])

#     respond_to do |format|
#       if @item.update_attributes(params[:item])
#         format.html { redirect_to @item, notice: 'Item was successfully updated.' }
#         format.json { head :no_content }
#       else
#         format.html { render action: "edit" }
#         format.json { render json: @item.errors, status: :unprocessable_entity }
#       end
#     end
#   end

#   # DELETE /items/1
#   # DELETE /items/1.json
#   def destroy
#     @item = Item.find(params[:id])
#     @item.destroy

#     respond_to do |format|
#       format.html { redirect_to items_url }
#       format.json { head :no_content }
#     end
#   end

#   def search
#     @items = Item.where('name = ?',params[:name])
#     render 'index'
#   end
# end

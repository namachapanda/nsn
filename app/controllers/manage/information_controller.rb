#encoding: utf-8

class Manage::InformationController < ApplicationController

 def index
    @information = Information.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @information }
    end
  end

  # GET /manage/information/new
  # GET /manage/information/new.json
  def new
    @information = Information.new
    @url = manage_information_index_path

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @information }
    end
  end

  # GET /manage/information/1/edit
  def edit
    @information = Information.find(params[:id])
    @url = manage_information_path(@information)
  end

  # POST /manage/information
  # POST /manage/information.json
  def create
    @information = Information.new(params[:information])

    respond_to do |format|
      if @information.save
        format.html { redirect_to manage_information_index_path, notice: 'Information was successfully created.' }
        format.json { render json: @information, status: :created, location: @information }
      else
        format.html { render action: "new" }
        format.json { render json: @information.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /manage/information/1
  # PUT /manage/information/1.json
  def update
    @information = Information.find(params[:id])

    respond_to do |format|
      if @information.update_attributes(params[:information])
        format.html { redirect_to manage_information_index_path, notice: 'Information was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @information.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /manage/information/1
  # DELETE /manage/information/1.json
  def destroy
    @information = Information.find(params[:id])
    @information.destroy

    respond_to do |format|
      format.html { redirect_to manage_information_index_path }
      format.json { head :no_content }
    end
   end
end

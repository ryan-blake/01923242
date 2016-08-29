class ImagesController < ApplicationController
  def new
    @image = Image.new(params[:image])
  respond_to do |format|
    if @image.save
      format.html { redirect_to @image, notice: 'Image was successfully created.' }
    else
      format.html { render action: "new" }
    end
    end
    end
end

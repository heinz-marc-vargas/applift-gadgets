class GadgetsController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @gadgets = current_user.gadgets
  end

  def show
    @gadget = current_user.gadgets.find(params[:id].to_i)
  end
  
  def new
    @gadget = Gadget.new
    render :form
  end

  def create
    @gadget = Gadget.new(params[:gadget])
    @gadget.user = current_user
    if @gadget.save
      redirect_to @gadget
    else
      render :form
    end
  end

  def edit
    @gadget = current_user.gadgets.find(params[:id].to_i)
    render :form
  end

  def update
    @gadget = current_user.gadgets.find(params[:id].to_i)
    if @gadget.update_attributes(params[:gadget])
      redirect_to @gadget
    else
      render :form
    end
  end

  def destroy
    @gadget = current_user.gadgets.find(params[:id].to_i)
    @gadget.destroy
    redirect_to gadgets_path
  end
  
end

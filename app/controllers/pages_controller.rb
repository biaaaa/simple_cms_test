class PagesController < ApplicationController
  
  layout "admin"

  def index
    @pages = Page.order("pages.position ASC")
  end

  def show
    @page = Page.find(params[:id])
  end

  def new
    @page = Page.new
  end

  def create
    @page = Page.new(page_params)
    if @page.save
      flash[:notice] = "Page Created Successfully!"
      redirect_to(:action => 'index')
    else
      flash[:notice] = "Page Create Failed! Please check the validation"
      render('new')
    end
  end

  def edit
    @page = Page.find(params[:id])
  end

  def update
    @page = Page.find(params[:id])
    if @page.update_attributes(page_params)
      flash[:notice] = "Page Updated Successfully!"
      redirect_to(:action => 'show', :id => @page.id)
    else      
      flash[:notice] = "Page Update Failed! Please check the validation"
      render('edit')
    end
  end

  def delete
    @page = Page.find(params[:id])
  end

  def destroy
    page = Page.find(params[:id]).destroy
    flash[:notice] = "Page '#{page.name}' destroyed Successfully!"
    redirect_to(:action => 'index')
  end

  private
    def page_params
      params.require(:page).permit(:name, :permalink, :subject_id, :position, :visible)
    end

end

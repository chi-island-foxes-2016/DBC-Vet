class DocumentsController < ApplicationController
  include AdminHelper

  def index
    # @documents = Document.all
    if admin?
      @groups = Group.all
    elsif session?
      @groups = user.groups.all
    else
      redirect_to login_path
    end
  end

  def show
    if admin? || session?
      @document = Document.find(params[:id])
    else
      redirect_to login_path
    end
  end

  def new
    if admin?
      @document = Document.new
    else
      redirect_to login_path
    end
  end

  def create
    @document = Document.new(document_params)
    if @document.save
      redirect_to documents_url
    else
      # flash error will be here
      redirect_to new_document_path(@document)
    end
  end

  def edit
    if admin?
     @document = Document.find(params[:id])
   else
    redirect_to login_path
  end

  def update
    @document = Document.find(params[:id])
    @document.update_attributes(document_params)
    if @document.save
      redirect_to document_path
    else
      redirect_to edit_document_path(@document)
    end
  end

  private

  def document_params
    params.require(:document).permit(:title, :content, :group_id)
  end
end

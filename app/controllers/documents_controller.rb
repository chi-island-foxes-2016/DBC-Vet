class DocumentsController < ApplicationController

  def index
    @documents = Document.all
  end

  def show
    @document = Document.find(params[:id])
  end

  def new
    @document = Document.new
  end

  def create
    @document = Document.new(document_params)
    if @document.save
      redirect_to @document
    else
      # flash error will be here
      redirect_to new_document_path(@document)
    end
  end

  def edit
    @document = Document.find(params[:id])
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
    params.require(:document).permit(:title, :content)
  end
end

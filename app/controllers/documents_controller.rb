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

  def edit
    @document = Document.find(params[:id])
  end
end

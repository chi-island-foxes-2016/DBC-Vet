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
    if (admin? || (session? && check_user_docs(params[:id])))
      @document = Document.find(params[:id])
      if session[:user_id]
        user = User.find_by(id: session[:user_id])
        if user.completed_documents.include?(@document)
          @completed = true
        end
      end
    else
      redirect_to login_path
    end
  end

  def check
    @document = Document.find(params[:id])
    @user = User.find_by(id: session[:user_id])
    if @user.completed_documents.include?(@document)
      @user.completed_documents.delete(@document)
    else
      @user.completed_documents << @document
    end
    redirect_to @document
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
      redirect_to documents_path
    end
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

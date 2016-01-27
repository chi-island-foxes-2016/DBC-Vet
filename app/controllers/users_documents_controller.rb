class UsersDocumentsController < ApplicationController

  def create
    @completion = UsersDocument.find(params[:id])
    @completion.destroy
  end

  def delete

  end

end

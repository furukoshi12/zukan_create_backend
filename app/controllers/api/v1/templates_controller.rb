class Api::V1::TemplatesController < ApplicationController
  def index
  end

  def create
  end

  def update
  end

  def destroy
  end

  private

  def template_params
    params.require(:template).permit(:name)
  end

end

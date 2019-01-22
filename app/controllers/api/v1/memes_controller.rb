class Api::V1::MemesController < ApplicationController

  before_action :find_meme, only: [:show, :update]

  def index
    @memes = Meme.all
    render json: @memes
  end

  def show
  end

  def create
  end

  def update
    @meme.update(meme_params)
    if @meme.save
      render json: @meme, status: :accepted
    else
      render json: { errors: @meme.errors.full_messages }, status: :unprocessible_entity
    end
  end

  private

  def meme_params
    params.permit()
  end

  def find_meme
    @meme = Meme.find(params[:id])
  end

end
class Api::V1::BoardsController < ApplicationController
  before_action :set_article, only: [:show, :update, :destroy, :discover]

  def index
    @boards = Boards.all
    render json: @boards
  end

  def show
    render json: {board: @board, mine_board: @board.all_bombs}
  end

  def create
    @board = Board.new(width: params[:width], height: params[:height])
    @board.field_generator
    if @board.save
      render json: @board
    else
      render json: @board.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @board.destroy
  end

  def discover
    begin
      mine = @board.is_a_mine?(params[:x],params[:y])
      render json: {mine: mine}
    rescue
      render json: {error: 'Bad coordinates'}
    end

  end

  private

  def set_article
    @board = Board.find(params[:id])
  end

end

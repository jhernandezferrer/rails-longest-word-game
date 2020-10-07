class GamesController < ApplicationController
  def new
    @letters = []
    rand(6..25).times do
      letter = %w(a b c d e f g h i j k l m n o p q r s t u v x y z)
      @letters << letter.sample
    end
    @letters
  end

  def score
    raise
  end
end

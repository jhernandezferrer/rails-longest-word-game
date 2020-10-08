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
    @letters = params[:letters].split
    @word = (params[:word] || "").upcase
    @included = included?(@word, @letters)
    @english_word = english_word?(@word)
  end

  private

  def included?(word, letters)
    word.chars.all? { |letter| word.count(letter) <= letters.count(letter) }
  end

  def english_word?(word)
    response = open("https://wagon-dictionary.herokuapp.com/#{word}")
    json = JSON.parse(response.read)
    puts json
    json['found']
  end
end

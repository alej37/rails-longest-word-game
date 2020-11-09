require 'open-uri'
require 'json'

class GamesController < ApplicationController
  def new
    @letters = Array.new(9) { ('A'..'Z').to_a.sample }
  end

  def score
    @word = params[:word].upcase
    url = "https://wagon-dictionary.herokuapp.com/#{@word}"
    words_dictionary = open(url).read
    @words_api = JSON.parse(words_dictionary)
    if @letters.include?(@word) == false
      @response = "Sorry but #{@word} can't be built out of #{@letters.join(",")}"
    elsif @words_api["found"] == true
      @response = "Congratulations #{@word} is a valid english word"
    else
      @response = "Sorry #{@word} does not seem to be a valid english word"
    end

  end
end

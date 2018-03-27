require "pry"

# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end
# Define your WIN_COMBINATIONS constant

WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [2,4,6],
  [0,4,8]
]

def won?(board)
  WIN_COMBINATIONS.detect do |win_combination|
    board[win_combination[0]] == board[win_combination[1]] &&
    board[win_combination[1]] == board[win_combination[2]] &&
    position_taken?(board, win_combination[0])
  end
end

def full?(board)
  board.none? do |index|
    index === nil || index === " "
  end
end

true - !won && full
false - !won && !full
false - won

def draw?(board)
  if won?(board) == false && full?(board) == true
    true
  elsif won?(board) == false && full?(board) == false
    false
  elsif won?(board)
      false
  end
end



def over?(board)
  if won?(board) || full?(board) || draw?(board)
    true
  end
end


=begin
 board.all? do |index|
#    won?(board) || full?(board) || draw?(board)
  end
end
=end

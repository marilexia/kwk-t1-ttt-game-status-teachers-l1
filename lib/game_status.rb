# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

####################

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1, 2], #top row
  [3, 4, 5], #middle row
  [6, 7, 8], #bottom row

  [0, 3, 6], #left column
  [1, 4, 7], #middle column
  [2, 5, 8], #right column

  [0, 4, 8], #left to right diagonal
  [2, 4, 6] #right to left diagonal
]

####################

def won?(board)

  WIN_COMBINATIONS.each do |win_combination|

  # win_combination is a 3 element array of indexes that compose a win, [0,1,2]
  # grab each index from the win_combination that composes a win.
    win_index_1 = win_combination[0] #row
    win_index_2 = win_combination[1] # column
    win_index_3 = win_combination[2] # diagonal

    position_1 = board[win_index_1] # load the value of the board at win_index_1
    position_2 = board[win_index_2] # load the value of the board at win_index_2
    position_3 = board[win_index_3] # load the value of the board at win_index_3

    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return win_combination # return the win_combination indexes that won.
      break
    end

    if position_1 == "O" && position_2 == "O" && position_3 =="O"
      return win_combination
      break
    end

  end
        return false
end

####################

def full?(board)

  board.each do |token|
    if token == " " || token == ""
      return false
      break
    end
  end
      return true

end

####################

def draw?(board)

  if won?(board)
    return false
  else full?(board)
    return true
  end

end

####################

def over?(board)

  if won?(board) || full?(board)
    return true
  else
    return false
  end

end

####################

def winner(board)

  if won?(board)
    winning_token = won?(board)
    winner = board[winning_token[0]]
    return winner
  else
    return nil
  end

end

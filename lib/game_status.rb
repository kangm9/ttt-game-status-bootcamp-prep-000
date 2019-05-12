# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6]]

  def won?(board)
    WIN_COMBINATIONS.each do |win_combo|
  
  # store each index from the win_combination that composes a win.
      
      win1 = win_combo[0]
      win2 = win_combo[1]
      win3 = win_combo[2]
      
  # check the board - load the value of the board at win1, win2, win3
      
      position_1 = board[win1]
      position_2 = board[win2]
      position_3 = board[win3]
      
      if position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 == "O" && position_2 == "O" && position_3 == "O"
        return win_combo
      end
    end
    false
  end
  
def full?(board)
   board.all? {|position| position == "X" || position == "O"}
end

def draw?(board)
  #true if board has not been won but full
  !won?(board) if full?(board)
end

def over?(board)
  #true if board has been won, is a draw or full
  won?(board) || draw?(board) || full?(board)
end

def winner(board)
  #return "X" or "O" that has won the game
    result = won?(board)
  if (result.class == Array)
    board[result[0]]
    else
    !won?(board)
    nil
  end
end

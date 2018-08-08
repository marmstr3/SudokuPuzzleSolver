function [isSolved] = isPuzzleSolved(sudokuPuzzle)
% isPuzzleSolved: Checks to see if the sudoku puzzle has been solved and
% returns a boolean of 1 if it is solved and 0 if it is not. 

isSolved = 1;

for i = 1:9
   if isSolved == 0
      break 
   else
       for j = 1:9
          if isSolved == 0
              break
          else
              if sudokuPuzzle(i,j) == 0
                  isSolved = 0;
              end
          end
       end
   end
end
end


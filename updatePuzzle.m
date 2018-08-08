function [sudokuPuzzle] = updatePuzzle(sudokuPuzzle)
% updatePuzzle updates the puzzle based on the cantBe matrix

cantBe = setCantBe(sudokuPuzzle);

for i = 1:9
    for j = 1:9
        solCounter = 0;
        for k = 1:9
            
            if cantBe(i,j,k) == 0
                solCounter = solCounter + 1;
                if solCounter > 1 % If there is more than one possible solution do not update this space
                   break 
                end
            end
            
        end
        if solCounter == 1 % If there is only one possible solution for the space, update the space
           for k = 1:9
              if cantBe(i,j,k) == 0
                 sudokuPuzzle(i,j) = k; 
                 break
              end
           end
        end
    end
end
    
end


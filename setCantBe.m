function [cantBe] = setCantBe(sudokuMatrix)
% Creates a 3-dimensional matrix where the k-dimension vectors contain all numbers that the point cannot be equal to.

cantBe = zeros(9,9,9); % paramaterize cantBe matrix
for i = 1:9 % row values
    for j = 1:9 % column values for position
        if sudokuMatrix(i,j) ~= 0 % If the space has a value, set cantBe to all numbers other than the space's value
            cantBe(i,j,:) = [1,2,3,4,5,6,7,8,9]; 
            k = sudokuMatrix(i,j);
            cantBe(i,j,k) = 0; % Set the k-position of the value in the k-vector equal to zero
        else % if the position is empty
            for z = 1:9 % column values for checking
                if sudokuMatrix(i,z) ~= 0 % if the point being checked is not zero
                    k = sudokuMatrix(i,z);
                    cantBe(i,j,k)=k; % make the correct spot in the cantBe matrix equal to the value at the checked point
                end
            end
            for z = 1:9 % row values for checking
                if sudokuMatrix(z,j) ~= 0 % if the point being checked is not zero
                    k = sudokuMatrix(z,j);
                    cantBe(i,j,k)=k; % make the correct spot in the cantBe matrix equal to the value at the checked point
                end
            end
            % check square for values
            if i<=3
                ii = [1,2,3]; % create column vector for square to be checked
            elseif i<=6
                ii = [4,5,6]; % create column vector for square to be checked
            else
                ii = [7,8,9]; % create column vector for square to be checked
            end
            if j<=3
                jj = [1,2,3]; % create row vector for square to be checked
            elseif j<=6
                jj = [4,5,6]; % create row vector for square to be checked
            else
                jj = [7,8,9]; % create row vector for square to be checked
            end
            for z = 1:3 % create loop to check points
                iic = ii(z); % set column value to be checked
                for k = 1:3
                    jjc = jj(k); % set row value to be checked
                    if sudokuMatrix(iic,jjc) ~= 0 % if the value at that point is not 0
                        a = sudokuMatrix(iic,jjc); % set variable equal to value at the checked point
                        cantBe(i,j,a)=a;
                    end
                end     
            end
        end
        
    end
end
cantBe = twinExclusion(cantBe);
end


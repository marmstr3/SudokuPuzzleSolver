function [cantBe] = twinExclusion(cantBe)
% Finds any mutually exclusive sets which each have and share only two possible solutions

 %% Section 1: Initialization
canBe = zeros(9,9,9);
twinExclusionCandidates = zeros(9,9); % This matrix holds a boolean (1 = true, 0 = false) in each location, representing whether or not that space is a Twin Exclusion candidate

%% Section 2: Propogate canBe matrix

for i = 1:9     
    for j = 1:9
        for k = 1:9
            if cantBe(i,j,k) == 0 % if value at point is 0
                canBe(i,j,k) = k; % set canBe value at that point to the value of that point
            end
        end
    end
end
   
%% Section 3: Find Twin Exclusions and update canBe and cantBe

for i = 1:9
    for j = 1:9 % loop through i,j,k of canBe
        canBeCounter = 0; % Counts number of possible solutions for a given space
        for k = 1:9        
            if canBe(i,j,k) ~= 0
                canBeCounter = canBeCounter +1; % if canBe(i,j,k) does not equal 0, counter++
            end
        end   
        if canBeCounter == 2
            twinExclusionCandidates(i,j) = 1; % If there are only two possible solutions for the space, the space is a Twin Exlusion candidate
        end
    end
end

%% Update cantBe Matrix

for i = 1:9     % loop through i,j of twinExclusionCandidates
    for j = 1:9            
        if twinExclusionCandidates(i,j) == 1 % If the space is a candidate for Twin Exclusion, iterate through the rest of the row and column for another candidate      
            if j ~= 9 % Can't be last space in the row
                for a = j+1:9 % Rows
                    if twinExclusionCandidates(i,a) == 1 % if this space is also a candidate, check if canBe(i,j) = canBe(i,a)         
                        if isequal(canBe(i,j,:), canBe(i,a,:))                                           
                            for b = 1:9  % iterate through b of canBe(i,j)  
                                if canBe(i,j,b) ~= 0 % if canBe(i,j,b) does not equal zero, the rest of the row can't be b.                                           
                                    for z = 1:9    
                                        if z ~= j && z ~= a
                                        cantBe(i,z,b) = b; 
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end       
        if i ~= 9 % Can't be last space in the column
            for a = i+1:9 % Columns  
                if twinExclusionCandidates(a,j) == 1 % If this space is also a candidate, check if canBe(i,j) = canBe(a,j)         
                    if isequal(canBe(i,j,:), canBe(a,j,:)) 
                        for b = 1:9 % iterate through b of canBe(i,j)
                            if canBe(i,j,b) ~= 0
                                for z = 1:9 % if canBe(i,j,b) does not equal zero, the rest of the column can't be b.
                                    if z ~= i && z ~= a
                                    cantBe(z,j,b) = b;
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end        
        % Create Location Index for Sub-Squares
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
            jj = [4,5,6]; %create row vector for square to be checked
        else
            jj = [7,8,9]; % create row vector for square to be checked
        end
        for z = 1:3 % iterate through z of the subsquare
           iic = ii(z);
           for k = 1:3 % iterate through k of the subsquare
              jjc = jj(k);
              if twinExclusionCandidates(iic,jjc) == 1 % if the space is a candidate, check if any other subsquare spaces are candidates
                  for a = 1:3
                     iic2 = ii(a);
                     for b = 1:3
                         jjc2 = jj(b);
                         if twinExclusionCandidates(iic2,jjc2) == 1 && iic ~= iic2 && jjc ~= jjc2 % if a second subsquare equals one and is not the original point check if their canBe vectors are equal
                            if isequal(canBe(iic,jjc,:), canBe(iic2,jjc2,:)) % if the vectors are the same check for vector values not equal to 0
                                for u = 1:9
                                    if canBe(iic,jjc,u) ~= 0 % if the value checked is not zero update cantBe for all other points in the subsquare's cantBe 
                                        for v = 1:3
                                            updateri = ii(v);
                                            for w = 1:3
                                                updaterj = jj(w);
                                                if updateri ~= iic && updateri ~= iic2 && updaterj ~=jjc && updaterj ~= jjc2
                                                cantBe(updateri,updaterj,u) = u;
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                         end
                     end
                  end
              end   
           end
        end
    end
end

end


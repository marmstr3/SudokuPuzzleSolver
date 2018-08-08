% Sudoku Puzzle Solver
% Michael Armstrong
% June 28, 2016

% This program accepts a sudoku puzzle (in the form of a 9x9 matrix) and
% solves it using setCantBe and twinExclusion principles. 

clear; clc; % 
%% Section 1: User Input and Error Handling

fprintf('Hello! Welcome to the Sudoku Solver. This program takes your sudoku puzzle \n(in the form of an excel file)and solves it for you!\nReady? Press any button to continue!')
pause


% sudokuPuzzle = xlsread('SamplePuzzle.xlsx');
sudokuPuzzle = xlsread(uigetfile);

%% Section 2: Initialize Variables

isSolved = 0;
unsolvable = 0;
%oldCantBe = zeros(9,9,9);
oldSudokuPuzzle = zeros(9,9);
% debugCounter = 0;

%% Section 3: Solve Puzzle

while isSolved == 0
   % debugCounter = debugCounter + 1;        
   oldSudokuPuzzle = sudokuPuzzle; % copy old puzzle
   
   sudokuPuzzle = updatePuzzle(sudokuPuzzle); % update puzzle
   
   % check if a change has been made to the puzzle
   if isequal(oldSudokuPuzzle, sudokuPuzzle) % If no changes are made, the puzzle is unsolvable. Display failure message. 
      fprintf('\nSorry, this program cannot solve this puzzle. The puzzle may be unsolvable.') 
      % disp(debugCounter)
      break
   end
   
   isSolved = isPuzzleSolved(sudokuPuzzle); % Check if the puzzle has been solved
   
   if isSolved == 1 % If solved, display solution
      solutionFound(sudokuPuzzle)
   end
end

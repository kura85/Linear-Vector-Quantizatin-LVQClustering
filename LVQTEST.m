%% CLustering Section:

function [ProClass,Index] = LVQTEST(Xvec,Prototype,LUT,H)
  % Clustring Input Sample to Nearest Prototype
  
  dVec = zeros(2*H,1);
  
  for i = 1:2*H
     dVec(i) = norm(Xvec - Prototype(:,i)); % Distance Between Data To All Prototypes
  end
  
  [~, Index] = min(dVec); % Give Index Of Nearest Prototype To Data
  ProClass = LUT(Index); % Class Of NEarest Prototype To Data
  
end
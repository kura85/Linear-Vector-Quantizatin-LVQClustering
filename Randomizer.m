%% Randomizing Data for Training:

function [Samples1,Targets1] = Randomizer(Samples,Targets)
  
  [Row1_1,Column1_1] = size(Samples);
  [Row2_1,Column2_1] = size(Targets);
  Samples1 = zeros(Row1_1,Column1_1); 
  Targets1 = zeros(Row2_1,Column2_1);
  
  x = randperm(Column1_1);
  for i = 1:Column1_1
    Randcol = x(i);
  
    Samples1(:,Randcol) = Samples(:,i);
    Targets1(:,Randcol) = Targets(:,i);
    
  end

end
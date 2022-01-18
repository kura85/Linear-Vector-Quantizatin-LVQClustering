%% Creating samples:a circle inside a square:

function [Samples1,Samples2,Targets1,Targets2] = createSamples(Count1,Count2,a)
% Produce Samples

C = 1; S = 1; r = a/(sqrt(2*pi));

while(C <= Count1 || S <= Count2)
    x = (rand - .5) * a;
    y = (rand - .5) * a;
    if((x^2 + y^2) <= r^2)
        Sample1(:,C) = [x;y];
        C = C+1;
    else
        Sample2(:,S) = [x;y];
        S = S+1;
    end
end

Samples1 = Sample1(: ,1:Count1);
Samples2 = Sample2(: ,1:Count2);
Targets1 = ones(1 ,Count2);
Targets2 = 2*ones(1 ,Count2);

end
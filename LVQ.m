%%% CLustering Data with Learning vector quantization(LVQ)
% Clustering Data which lookslikes a circle in a square:

%% Create Samples:
prototypeCounts  = input('Number Of Prototypes: ');%Number Of Prototype
squareDataCounts = input('Number Of Sample1 Data: ');% Number Of Square Data
circleDataCounts = input('Number Of Sample2 Data: ');% Number Of Circule Data

a = input('Length Of Square: '); % Length Of Square
epochs = input('Number Of Epoch: ');%Number Of Epoch

% creating samples:
[squareSamples, circleSamples, squareTargets, circleTargets] = createSamples...
squareDataCounts,...
circleDataCounts,...
a); 

%% Select Prototypes & Make LUT & Matrix Of Samples
squarePrototypes = squareSamples(:, 1:prototypeCounts); % Select Prototype For First Group
circlePrototypes = circleSamples(:, 1:prototypeCounts); % Select Prototype For Second Group
squarePrototypesTargets = squareTargets(:, 1:prototypeCounts); % Select Targets For First Prototypes
circlPrototypesTargets = circleTargets(:, 1:prototypeCounts);  % Select Targets For Second Prototypes

squareModifiedSamples = squareSamples(:, prototypeCounts+1:end); % Modify First Group Samples By Decreasing Their's Prototype. 
circleModifiedSamples = circleSamples(:, prototypeCounts+1:end);% Modify Second Group Samples By Decreasing Their's Prototype.
squareModifiedTargets = squareTargets(:, prototypeCounts+1:end);% Modify First Group Target By Decreasing Their's Prototype Targets.
circleModifiedTargets = circleTargets(:, prototypeCounts+1:end);% Modify Second Group Target By Decreasing Their's Prototype Targets.
Samples = [squareModifiedSamples,circleModifiedSamples];% Matrix Of Sample
Targets = [squareModifiedTargets,circleModifiedTargets];% Matrix Of Targets

Prototypes = [squarePrototypes,circlePrototypes]; % Matrix Of Prototype
prototypeTargets = [squarePrototypesTargets,circlPrototypesTargets];% Matrix Of Prototypes Target (LUT)

[squareSamples,squareTargets] = Randomizer(Samples,Targets); % Randomize Samples

hold on
figure(1)
plot(squareModifiedSamples(1,:),squareModifiedSamples(2,:),'r.')
plot(circleModifiedSamples(1,:),circleModifiedSamples(2,:),'b.')
title('Original Samples');

%% Modify Protoypes

#% This Function Give Modify Prototypes And LUT.
[Prototypes,LUT] = LVQTrain(squareSamples, squareTargets, Prototypes,...
 prototypeTargets, prototypeCounts, epochs);

hold on
figure(2)
plot(Prototypes(1,:),Prototypes(2,:))

%% Clustring Section:

for i = -round(a/2):.05:round(a/2)
     for j = -round(a/2):.05:round(a/2)
         xVec = [i;j];
         [Class,Index] = LVQTEST(xVec,Prototypes,LUT,prototypeCounts);
         if(Class == 1)
             hold on
             plot(i,j,'r.')
         else
             hold on
             plot(i,j,'b.')
         end
     end
end
title('Estimated Data And Protoype After Modifying');
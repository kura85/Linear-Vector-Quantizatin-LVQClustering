%% Training Function for Optimizing the position of Prototypes:

function[Prototype,LUT] = LVQTrain(Sample,Target,Prototype,LUT,H,Epoch)
  % Determine Adjusted Prototypes
  Alpha = .01; 
  [~,L] = size(Sample);
  for epoch = 1:Epoch
     Alpha = Alpha/epoch;
     for k = 1:L
          rSample = Sample(:,k); % Data
          rTarget = Target(:,k); % Target Of Data
          [ProClass, Index] = LVQTEST(rSample,Prototype,LUT,H); % This Function Give Class And Index Of Nearest Prototype To Data
          d = norm(rSample - Prototype(:,Index)); % Distance Between Data And Nereast Prototype
          if (rTarget == ProClass)
            delta = Alpha * d; % Delta For Modify Prototype That In Class By Data 
          else
            delta = - Alpha * d; % % Delta For Modify Prototype That Against Class By Data
          end
          Prototype(: ,Index) = Prototype(: ,Index) + delta; % Modifying Prototype
      end
  end
end
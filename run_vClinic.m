

nSubjects = 1;
nDays = 6*30;
hasCarbCountingError = true;
cgmModelIsActive = true;
hasDiurnalProfile = true;
isParallel = true;
noiseFactor = 0.4;
tdbdScaleFactor = [0.7, 1, 1.3];
crScaleFactor = [0.7, 1, 1.3];
isfScaleFactor = [0.7, 1, 1.3];
missedMealProbability = 0.01;
insulinPathwayReliability = 100;
hyperThreshold = 250;
hyperInterval = 3*60;
hypoThreshold = 75;
hypoInterval = 30;
rescueGrams = 15;
missedBolusProbability = 0.05;


config = generateConfig(nSubjects, nDays, isParallel, hasCarbCountingError, ...
    hasDiurnalProfile, cgmModelIsActive, noiseFactor, tdbdScaleFactor, crScaleFactor, isfScaleFactor, ...
    hyperThreshold, hyperInterval, hypoThreshold, hypoInterval, rescueGrams, ...
    missedBolusProbability, missedMealProbability,   insulinPathwayReliability);

%criticalParameters = com.bigfoot.vclinic.analysis.CriticalParameters();
results = com.bigfoot.vclinic.StartSimulation(config);

save(strcat('results.mat'), 'results', '-v7.3')

 

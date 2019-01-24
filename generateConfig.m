                                       
function config = generateConfig(nSubjects, nDays, isParallel, hasCarbCountingError, ...
    hasDiurnalProfile, cgmModelIsActive, noiseFactor, tdbdScaleFactor, crScaleFactor, isfScaleFactor, ...
    hyperThreshold, hyperInterval, hypoThreshold, hypoInterval, rescueGrams, ...
    missedBolusProbability, missedMealProbability,   insulinPathwayReliability)

    config = struct;
    config.class = 'com.bigfoot.vclinic.SimulationFactory';
    config.isParallel = isParallel;
    config.numOfDays = nDays;
    
    config.subjectPopulation = struct;
    config.subjectPopulation.class = ...
        'com.bigfoot.vclinic.population.RepresentativeSubjectPopulation';
    config.subjectPopulation.noiseFactor = noiseFactor;
    config.subjectPopulation.numOfSubjects = nSubjects;
    config.subjectPopulation.tdbdScaleFactor = tdbdScaleFactor;
    config.subjectPopulation.crScaleFactor = crScaleFactor;
    config.subjectPopulation.isfScaleFactor = isfScaleFactor;
    config.subjectPopulation.hasDiurnalProfile = hasDiurnalProfile;
    
%     config.subjectPopulation.glucoseStatistics = struct;
%     config.subjectPopulation.glucoseStatistics.muStarMgDl = 150;
%     config.subjectPopulation.glucoseStatistics.sigmaStarMgDl = 1.5;
    
    config.mealManager = struct;
    config.mealManager.class = 'com.bigfoot.vclinic.meal.VariableMealModel';
    config.mealManager.missedBolusProbability = missedBolusProbability;
    config.mealManager.missedMealProbability = missedMealProbability;
    config.mealManager.hasUserCarbCountingError = hasCarbCountingError;
      
    config.exerciseManager = struct;
    config.exerciseManager.class = ['com.bigfoot.vclinic.exercise.ExerciseM' ...
                                    'anager'];
    config.exerciseManager.startTimeHrs = [];
    config.exerciseManager.durationMins = [];
    
    config.cgmManager = struct;
    config.cgmManager.class = 'com.bigfoot.vclinic.cgm.GenericCgmModel';
    config.cgmManager.isActive = cgmModelIsActive;
 
    config.correctionManager = struct;
    config.correctionManager.class = ...
        'com.bigfoot.vclinic.behavior.TimeBasedCorrectionManager';
    
    config.correctionManager.hyperRules = struct;
    config.correctionManager.hyperRules.class = ...
        'com.bigfoot.vclinic.behavior.HyperglycemicBehavior';
    config.correctionManager.hyperRules.thresholdMgDl = hyperThreshold;
    config.correctionManager.hyperRules.intervalMins = hyperInterval;
    
    config.correctionManager.hypoRules = struct;
    config.correctionManager.hypoRules.class = ...
        'com.bigfoot.vclinic.behavior.HypoglycemicBehavior';
    config.correctionManager.hypoRules.thresholdMgDl = hypoThreshold;
    config.correctionManager.hypoRules.intervalMins = hypoInterval;
    config.correctionManager.hypoRules.rescueGrams = rescueGrams;
            
%     config.correctionManager = struct;
%     config.correctionManager.class = ['com.bigfoot.vclinic.behavior.AlarmBasedCorrectionManager'];
%     config.correctionManager.hyperRules = struct;
%     config.correctionManager.hyperRules.class = ...
%       'com.bigfoot.vclinic.behavior.HyperAlarmBehavior';
%     config.correctionManager.hyperRules.correctionProbability = correctionProbability;
% 
%     
%     config.correctionManager.hypoRules = struct;
%     config.correctionManager.hypoRules.class = ...
%       'com.bigfoot.vclinic.behavior.HypoAlarmBehavior';
%     config.correctionManager.hypoRules.rescueGrams = rescueGrams;
%     
%     config.alarmManager = struct;
%     config.alarmManager.class = ['com.bigfoot.vclinic.alarms.AlarmManagerWithAlarmReannounciations'];
%     config.alarmManager.hypoAlarmThresholdMgDl = 54;
%     config.alarmManager.hypoAlertThresholdMgDl = 70;
%     config.alarmManager.predictiveHypoAlertThresholdMgDl = 54;
%     config.alarmManager.hypoPredictionHorizonMin = 30;
%     config.alarmManager.hyperAlertSensitivity = 2.4;
%     config.alarmManager.hyperAlarmThresholdMgDl = 300;
%     config.alarmManager.hyperAlarmDurationMin = 180;
%     config.alarmManager.deadbandPercent = 10;
%     config.alarmManager.hypoReannounciationMin = 45;
% 	config.alarmManager.hyperReannounciationMin = 120;
% 	config.alarmManager.callFrequencyMin=5;
    
    config.insulinDeliveryPathwayManager = struct;
    config.insulinDeliveryPathwayManager.class = ['com.bigfoot.vclinic.faults.InsulinDeliveryFailureModel'];
	config.insulinDeliveryPathwayManager.insulinDeliveryReliabilityPercentile = insulinPathwayReliability;
 
%     config.userAckMaxConstraint = userAckMaxConstraint;
    
    config.controllerClasses = cell(1, 1);
    config.controllerClasses{1,1} = ['com.bigfoot.vclinic.controller.SmartloopController'];
    
%     config.MDIonboardingManager = struct;
%     config.MDIonboardingManager.class = ...
%         'com.bigfoot.vclinic.MDI.BaseMDIonboardingManager';
%     config.MDIonboardingManager.MDIstartTime = '';
%     config.MDIonboardingManager.MDIdurationActualHr = 0;
%     config.MDIonboardingManager.MDIdurationAnnouncedHr = 0;
%     
end


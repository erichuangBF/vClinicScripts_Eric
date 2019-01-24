% ehuang

HOURS_IN_DAY = 24;
MINUTES_IN_HOUR = 60;
ORIGINAL_INTERVAL_MINUTES = 5;

% Analysis and Visualization of Loss and MPC Prediction Quality
%     Comparison of vClinic results between two 'forget' alternatives
%     
%     Requirements:
%          - tools from https://github.com/erichuangBF/MatlabTools
%%
clear;

files = ["../SimResults/191011_30DayForget/com.bigfoot.vclinic.controller.SmartloopController_raw.mat" ...
         "../SimResults/191011_NoForget/com.bigfoot.vclinic.controller.SmartloopController_raw.mat"];

optionNames = ["Forget30Day", "ForgetNever"];

assert(length(files) == length(optionNames), ...
    "Number of result files don't match number of option names provided");

% create struct of result structs
eval(strcat("resultsMatrix = struct('", strjoin(optionNames,...
    "',{'placeholder'},'"), "',{'placeholder'});"));

%%
disp('* Loading From Mat Files')
for option = 1:length(files)
    eval(strcat('resultsMatrix.', optionNames(option), ...
        ' = loadVClinicResultsStructFromFile(files(', num2str(option),...
        "));"));
end

%%
disp('* Identify BR, CR, and ISF for each subject')
brCrIsf = getBrCrIsf(resultsMatrix);

%%
disp('* Calculating Loss')
lossMatrix = mpcPredictionLoss(7, resultsMatrix);

%%
disp('* Plotting Mean Loss')
plotMeanMpcLoss(optionNames, lossMatrix, "../Plots/");

%%
disp('* Plotting Loss of Each Subject')
plotLossOfEachSubjectOverTime(lossMatrix, 3, optionNames, brCrIsf, "../Plots/");

%%
disp('* Plotting Mean Loss vs Subject')
plotMeanLossHistogram(lossMatrix, optionNames, "../Plots/");

%%
disp('* Plotting MPC Prediction Quality')
plotMpcPredictQuality(resultsMatrix, lossMatrix, [5 50 95], "../Plots/");


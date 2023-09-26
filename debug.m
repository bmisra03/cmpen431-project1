%loading this file defines imrgb and layerResults
load 'debuggingTest.mat'

%loading this file defines filterbanks and biasvectors
load 'CNNparameters.mat'

%sample code to show image and access expected results
figure; imagesc(imrgb); truesize(gcf,[64 64]);
for d = 1:length(layerResults)
    result = layerResults{d};
    fprintf('layer %d output is size %d x %d x %d\n', ...
        d,size(result,1),size(result,2),size(result,3));
    fprintf('layer %d output is size %d x %d x %d\n', ...
        d,size(result,1),size(result,2),size(result,3));
end
%{
%find most probable class
classprobvec = squeeze(layerResults{end});
[maxprob,maxclass] = max(classprobvec);
%note, classlabels is defined in 'cifar10testdata.mat'
fprintf('estimated class is %s with probability %.4f\n',...
    classlabels(maxclass),maxprob);
%}
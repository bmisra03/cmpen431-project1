%loading this file defines imrgb and layerResults
load 'debuggingTest.mat'

%loading this file defines filterbanks and biasvectors
load 'CNNparameters.mat'

%check the difference between expected and observed values in layer 1
computed = imnormalize(imrgb);
expected = layerResults{1};
diff = (computed-expected).^2;
totalDiff = sum(diff(:));
fprintf('difference between expected and observed values in layer 1 is %0.2f\n', ...
        totalDiff);

%check the difference between expected and observed values in layer 2
computed = convolve(computed,filterbanks{2},biasvectors{2});
expected = layerResults{2};
diff = (computed-expected).^2;
totalDiff = sum(diff(:));
fprintf('difference between expected and observed values in layer 2 is %0.2f\n', ...
        totalDiff);

%check the difference between expected and observed values in layer 3
computed = relu(computed);
expected = layerResults{3};
diff = (computed-expected).^2;
totalDiff = sum(diff(:));
fprintf('difference between expected and observed values in layer 3 is %0.2f\n', ...
        totalDiff);

%{
%sample code to show image and access expected results
figure; imagesc(imrgb); truesize(gcf,[64 64]);
for d = 1:length(layerResults)
    result = layerResults{d};
    fprintf('layer %d output is size %d x %d x %d\n', ...
        d,size(result,1),size(result,2),size(result,3));
    fprintf('layer %d output is size %d x %d x %d\n', ...
        d,size(result,1),size(result,2),size(result,3));
end
%find most probable class
classprobvec = squeeze(layerResults{end});
[maxprob,maxclass] = max(classprobvec);
%note, classlabels is defined in 'cifar10testdata.mat'
fprintf('estimated class is %s with probability %.4f\n',...
    classlabels(maxclass),maxprob);
%}
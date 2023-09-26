%normalize input image such that every pixel ranges
%from -0.5 to 0.5
function [ normalizedImage ] = imnormalize(inputImage)
    normalizedImage = double(inputImage)/255.0 - 0.5;
end
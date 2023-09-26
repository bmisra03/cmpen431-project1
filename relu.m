function [ rectifiedImage ] = relu(inputImage)
    rectifiedImage = max(inputImage, 0);
end
function [ convolvedImage ] = convolve(inputImage, filterbank, biasvec)
    convolvedImage = zeros(size(inputImage,1), size(inputImage,2), size(filterbank, 4));
    for i = 1:size(convolvedImage,3)
        filter = filterbank(:,:,:,i);
        for j = 1:size(inputImage,3)
            convolvedImage(:,:,i) = convolvedImage(:,:,i) + imfilter(inputImage(:,:,j),filter(:,:,j),'conv', 'same');
        end
        convolvedImage(:,:,i) = convolvedImage(:,:,i) + biasvec(i);
    end
end
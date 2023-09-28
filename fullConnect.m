% Andrei Dawinan - abd5635@psu.edu

function [ output ] = fullConnect(inputImage, filterbank, biasvals)
    output = zeros(1, 1, size(filterbank, 4));
    % filters: index from 1 to D2
    for filters = 1:size(filterbank, 4)
        filter = filterbank(:,:,:,filters);
        % element-wise multiplication per filter + bias
        output(:,:,filters) = sum(inputImage .* filter, "all") + biasvals(filters);
    end
end
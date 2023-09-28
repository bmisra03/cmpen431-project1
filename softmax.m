%Bharavi Misra
function [output] = softmax(input)
    output = zeros(1, 1, size(input,3));
    alpha = max(input);
    denominator = sum(exp(input-alpha));
    for i=1:size(output,3)
        output(:,:,i) = exp(input(:,:,i)-alpha)/denominator;
    end
end
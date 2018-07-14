function answer = partial_function(number_of_hidden, weights)
    hidden_configurations = vbins(number_of_hidden);
    overall = 0;
    for j = 1:size(hidden_configurations, 1);
        h = hidden_configurations(j,:);
        Z = 1;
        for i = 1:size(weights, 2);
            Z *= 1+exp(sum(h*weights(:,i)));
        end
        overall += Z;
    end
    answer = log(overall);
end

function binary_vectors = vbins(len)
    if len == 1
        binary_vectors = [ 0 ; 1 ];
    else
        one_less = vbins(len-1);
        comb_zeros = [ zeros(size(one_less, 1), 1) one_less ];
        comb_ones = [ ones(size(one_less, 1), 1) one_less ];
        binary_vectors = [ comb_zeros; comb_ones];
    end
end
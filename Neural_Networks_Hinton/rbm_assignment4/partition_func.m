function ret = partition_func(w)
%  partition_func = sum(log(1+((prod((1 + exp(w)),2))./(2^2)))
  h = dec2bin(0:2^size(w,1)-1) - '0';
  ret = log(sum((1+((prod((1 + exp(h*w)),2))))))
end
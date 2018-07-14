function ret = cd1(rbm_w, visible_data)
% <rbm_w> is a matrix of size <number of hidden units> by <number of visible units>
% <visible_data> is a (possibly but not necessarily binary) matrix of size <number of visible units> by <number of data cases>
% The returned value is the gradient approximation produced by CD-1. It's of the same shape as <rbm_w>.
%    error('not yet implemented');
  visible_data = sample_bernoulli(visible_data);
  hidden_probs = visible_state_to_hidden_probabilities(rbm_w, visible_data);
  hidden_state = sample_bernoulli(hidden_probs);
  rec_vis_data = sample_bernoulli(hidden_state_to_visible_probabilities(rbm_w,hidden_state));
  rec_hid_probs = visible_state_to_hidden_probabilities(rbm_w,rec_vis_data);
%  rec_hid_data = sample_bernoulli(rec_hid_probs);
%  ret = configuration_goodness_gradient(visible_data,hidden_state) - configuration_goodness_gradient(rec_vis_data,rec_hid_data);
  ret = configuration_goodness_gradient(visible_data,hidden_state) - configuration_goodness_gradient(rec_vis_data,rec_hid_probs);
end
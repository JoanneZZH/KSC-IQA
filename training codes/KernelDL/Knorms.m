% Usage: [mynorm] = Knorms(A,K)
% compute norm of columns in feature space
% given coefficients matrix A and Gram matrix
function [mynorm] = Knorms(A,K)

% mynorm = zeros(size(A,2),1);
% 
% for i=1:size(A,2)
%     a = A(:,i)'*K*A(:,i);
%     mynorm(i)  = sqrt(max(a,0));
% end
% %

a = diag(A'*K*A);
%b = dot(A, K*A,1)';
% sum(abs(a-mynorm))
mynorm  = sqrt(max(a,0));

end
% % % a = A(:,1);
% % % whos
% % % for i=1:size(A,2)
% % %     mynorm(i)  = sqrt(max(sum(K(:)),0));
% % % end
% %
% %
% % parfor i=1:4337
% %     mynorm(i)  = sqrt(max(A(:,i)'*K*A(:,i),0));
% % end
% %
% % end

% function Knorms()
%     N =4000;
%     K = randn(N, N);
%     res = zeros(N, 1);
%     for k = 1:N
%         res(k)= sum(K(:));
%     end
% end
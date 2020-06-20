function [coeff, err] = project_onto_kksvd(dict,z,dicAtomNum)
% Usage: [coeff err] = project_onto_kksvd(dict,z,dicAtomNum)
% Basically, use KOMP to decode z as sparse combs in the feature space
kernel = dict.kernel; 
kervar1 = dict.kervar1; 
kervar2 = dict.kervar2 ; 

K_dd = gram(dict.base',dict.base',kernel,kervar1, kervar2) ; 
K_zd = gram(z,dict.base',kernel,kervar1,kervar2); % lack normalization here???
K_zz = gram(z,z,kernel,kervar1,kervar2); 
[coeff, err] = KOMP(dict.dicoker, K_dd, K_zd, dicAtomNum, K_zz) ; 
end
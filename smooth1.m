function outarray = smooth1(inarray,factor,method)
% expands the input sample array by interpolating "virtual beams" between the real ones.
% inarray = input frame from data file
% factor = 4 or 8 This gives the output spacing of the adjacent real beams
% method = text string of method of interpolation. If 'expand', it uses
if isequal(method,'expand')&(factor == 4)
    outarray =expand4(inarray); %custom linear expansion routine that is fast. See expand4 for details.
else
    [m,n]=size(inarray);
    nout=n*factor - factor + 1; %output width dimension
    outarray = uint8(zeros(512,nout)); %preassign array dimensions
    inarray64=double(inarray);
    for index =1:512
        outarray(index,:) =uint8(interp1([1:n],inarray64(index,:),[1:.25:n],method));
    end
end


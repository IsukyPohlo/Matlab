function y = calcEntropia(A)

[FrecAbs, Lvls] = imhist(A);

Tot = numel( A );

FrecRel = FrecAbs / Tot;

MedInfo = log2(1./FrecRel);

MedInfo(MedInfo==inf)=0;

y = sum(MedInfo.*FrecRel)

end
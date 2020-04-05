%cal posar-se a la carpeta que toca o modificar el path dels scripts
H = initModels;
data = tryModels(H,0);
%percentiles
barcelona=squeeze(data(2,:,:,:));
barcelonaInter=data(2,:,1,:);
barcelonaChi=data(2,:,2,:);
barcelonaInter=squeeze(barcelonaInter);
barcelonaChi=squeeze(barcelonaChi);
BChi = prctile(barcelonaChi, 65);
BInter = prctile(barcelonaInter, 35);
votedIntersec = resultsVoting(data,BInter,1);
votedChi = resultsVoting(data,BChi,2);

%m=min(votedIntersec,votedChi);
M=max(votedIntersec,votedChi);
%S=votedIntersec+votedChi;

voting3 = M>2;
totalsM = sum(voting3,2)
find(voting3(2,:) == 0)
totalsP = totalsM./0.4

%{
voting1 = M>=1;
totals1 = sum(voting1,2)
voting1 = m>=1;
totals1 = sum(voting1,2)

voting2 = M>=2;
totals2 = sum(voting2,2)
voting2 = m>=2;
totals2 = sum(voting2,2)

voting3 = M>2;
totals3 = sum(voting3,2)
voting3 = m>2;
totals3 = sum(voting3,2)
%}

%cal posar-se a la carpeta que toca o modificar el path dels scripts
[h1, h2, h3] = initModels;
data = tryModels(h1, h2, h3);
%percentiles
barcelonaInter=data(2,:,1,:);
barcelonaChi=data(2,:,2,:);
barcelonaInter=squeeze(barcelonaInter);
barcelonaChi=squeeze(barcelonaChi);
BChi = prctile(barcelonaChi, 65);
BInter = prctile(barcelonaInter, 35);
votedIntersec = resultsVoting(data,BInter(1),BInter(2),BInter(3),1);
votedChi = resultsVoting(data,BChi(1),BChi(2),BChi(3),2);

%m=min(votedIntersec,votedChi);
M=max(votedIntersec,votedChi);

voting3 = M>2;
totals3 = sum(voting3,2)

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

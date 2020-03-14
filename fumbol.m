%cal posar-se a la carpeta que toca o modificar el path dels scripts
[h1, h2, h3] = initModels;
data = tryModels(h1, h2, h3);
voted = resultsVoting(data,0.50,0.60,0.60);
voting2 = voted>=2;
totals2 = sum(voting2,2)
voting3 = voted>2;
totals3 = sum(voting3,2)
acmilan=data(1,:,:);
acmilan=squeeze(acmilan);
barcelona=data(2,:,:);
barcelona=squeeze(barcelona);
chelsea=data(3,:,:);
chelsea=squeeze(chelsea);
A = prctile(acmilan,30)
B = prctile(barcelona,30)
C = prctile(chelsea,30)
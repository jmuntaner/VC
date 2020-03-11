%cal posar-se a la carpeta que toca o modificar el path dels scripts
[h1, h2, h3] = initModels;
data = tryModels(h1, h2, h3);
voted = resultsVoting(data,0.25,0.55,0.55);
voting2 = voted>=2;
totals2 = sum(voting2,2)
voting3 = voted>2;
totals3 = sum(voting3,2)
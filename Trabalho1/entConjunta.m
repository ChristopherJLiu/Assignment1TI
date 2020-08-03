function[entropia] = entConjunta(Fonte,Alfa)

    %transforma a matriz num vector
    Fonte = reshape(Fonte,1,[]);
    lenFonte = length(Fonte);
	
	if mod(lenFonte,2) == 1
		Fonte =  [Fonte 0];
		lenFonte = length(Fonte);
	end
	
	seq = zeros(length(Alfa));
	
	for i = 1:2:lenFonte
		x = find(Fonte(i) == Alfa);
		y = find(Fonte(i+1) == Alfa);
		seq(x,y) = seq(x,y) +1;
	end
	
	seq(find(seq==0)) = [];
	p = seq/sum(seq);
	entropia = sum(p.*log2(p.^(-1)));
	entropia = entropia/2;

    %cria uma matriz em que cada elemento é a combinação de dois elementos do alfabeto
%    lenAlfa = length(Alfa);
 %   nCasos = zeros(lenAlfa,lenAlfa);
  %  step = Alfa(2)-Alfa(1);
    %preenche a matriz com o numero de ocorencias de cada combinação
   % for i = 1:lenFonte-1
    %    x = (Fonte(i)-Alfa(1))/step+1;
     %   y = (Fonte(i+1)-Alfa(1))/step+1;
      %  nCasos(x,y)= nCasos(x,y) + 1;
    %end;
    %calcula a probablidade de cada combinaç
    %prob = nCasos/(lenFonte-1);
    %prob = reshape(prob,1,[]);
    %prob = prob(prob~=0);

    %calcula a entropia
    %entro = - sum(prob.*log2(prob))/2;
    
end

:- ensure_loaded(heart_Testset).
:- ensure_loaded(heart_Trainingset).

% classifica_bayes( +Oggetto, -Classe)
%  Oggetto: [Attributo1=Valore1, .. , AttributoN=ValoreN]
%  Classe: classe a cui potrebbe appartenere un oggetto caratterizzato da quelle coppie
%  Attributo=Valore
classifica_bayes(X,C) :-
    probs(X,W),
    max(W,C/_).

% calcola la likelihood di E (un oggetto costituito da una lista di attributi in
% forma chiave=valore), di appartenere a ciscuna classe
probs(X,W) :-
    setof(C,E^e(C,E),Cs),
    findall(C/P,(member(C,Cs),
                 cond_prob(X,C,PL),
                 class_prob(C,PC),
                 mult(PL,PS),
                 P is PS*PC),W).

% genera una lista LP di probabilità condizionate di ogni coppia attributo-valore
% in E, data la classe
cond_prob([],_,[]).
cond_prob([AV|L],C,[AV/P|PL]) :-
    findall(_,e(C,_),All),
    length(All,N),
    findall(_,(e(C,AVL),member(AV,AVL)),W),
    length(W,M),
    P is M/N,
    cond_prob(L,C,PL).

class_prob(C,PC) :-
    findall(_,e(_,_),All),
    length(All,N),
    findall(_,e(C,_),W),
    length(W,M),
    PC is M/N.
    
max([X],X) :- !.
max([X/M|T],Y/N) :- 
    max(T,Z/K), 
    (M>K,Y/N=X/M;Y/N=Z/K), !.

%moltiplica le probabilità in LP
mult([],1) :- !.
mult([_/P|L],Ps) :-
    mult(L,P1),
    Ps is P1*P.

stampa_matrice_di_confusione :-
	findall(Classe/Oggetto,s(Classe,Oggetto),TestSet),
	length(TestSet,N),
	valuta(TestSet,VN,0,VP,0,FN,0,FP,0,NC,0),
	A is (VP + VN) / (N - NC), % Accuratezza
	E is 1 - A,		   % Errore
	TPR is VP/(VP+FN), %SENSIBILITA
	TNR is VN/(VN+FP), %SPECIFICITA
	PPV is VP/(VP+FP), %PRECISIONE
	FNR is FN/(FN+VP), %TASSO DI ERRORE
	FDR is FP/(FP+VP), %TASSO DI FALSE SCOPERTE
	FOR is FN/(FN+VN), %TASSO DI FALSE OMISSIONI
	write('Test effettuati :'),  writeln(N),
	write('Test non classificati :'),  writeln(NC),
	write('Veri Negativi  '), write(VN), write('   Falsi Positivi '), writeln(FP),
	write('Falsi Negativi '), write(FN), write('   Veri Positivi  '), writeln(VP),
	write('Accuratezza: '), writeln(A),
	write('Errore: '), writeln(E),
	write('Sensibilita\': '), writeln(TPR),
	write('Specificita\': '), writeln(TNR),
	write('Precisione: '), writeln(PPV),
	write('Tasso di errore: '), writeln(FNR),
	write('Tasso di false scoperte: '), writeln(FDR),
	write('Tasso di false omissioni: '), writeln(FOR).

valuta([],VN,VN,VP,VP,FN,FN,FP,FP,NC,NC).
valuta([malato/Oggetto|Coda],VN,VNA,VP,VPA,FN,FNA,FP,FPA,NC,NCA) :-
	classifica_bayes(Oggetto,malato), !,      % prevede correttamente la non sopravvivenza
	VNA1 is VNA + 1,
	valuta(Coda,VN,VNA1,VP,VPA,FN,FNA,FP,FPA,NC,NCA).
valuta([sano/Oggetto|Coda],VN,VNA,VP,VPA,FN,FNA,FP,FPA,NC,NCA) :-
	classifica_bayes(Oggetto,malato), !,      % prevede erroneamente la non sopravvivenza
	FNA1 is FNA + 1,
	valuta(Coda,VN,VNA,VP,VPA,FN,FNA1,FP,FPA,NC,NCA).
valuta([malato/Oggetto|Coda],VN,VNA,VP,VPA,FN,FNA,FP,FPA,NC,NCA) :-
	classifica_bayes(Oggetto,sano), !, % prevede erroneamente la sopravvivenza
	FPA1 is FPA + 1,
	valuta(Coda,VN,VNA,VP,VPA,FN,FNA,FP,FPA1,NC,NCA).
valuta([sano/Oggetto|Coda],VN,VNA,VP,VPA,FN,FNA,FP,FPA,NC,NCA) :-
	classifica_bayes(Oggetto,sano), !, % prevede correttamente la sopravvivenza
	VPA1 is VPA + 1,
	valuta(Coda,VN,VNA,VP,VPA1,FN,FNA,FP,FPA,NC,NCA).
valuta([_/_|Coda],VN,VNA,VP,VPA,FN,FNA,FP,FPA,NC,NCA) :- % non classifica
	NCA1 is NCA + 1,
	valuta(Coda,VN,VNA,VP,VPA,FN,FNA,FP,FPA,NC,NCA1).
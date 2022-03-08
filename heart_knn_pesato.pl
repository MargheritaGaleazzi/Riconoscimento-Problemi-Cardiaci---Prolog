:- ensure_loaded(heart_attributi).
:- ensure_loaded(heart_Testset).
:- ensure_loaded(heart_Trainingset).

% Classifica mediante l'algoritmo K-Nearest Neighbor
classifica_knn_pesato(Istanza,K,Class) :-
    vicini(Istanza,K,Vicini),
    somma_pesata(Vicini,Somma),
    max(Somma,_-Class).
	
% Trova i K "vicini" dell'Istanza
vicini(Istanza,K,Vicini) :-
    findall(D-C,(e(C,E),dist(Istanza,E,D)),Ds),
    keysort(Ds,L),
    primo(K,L,Vicini).

% Calcola la distanza ovvero il numero di coppie attributo-valore diversi tra X e Y
dist([],[],0).
dist([X|T],[X|V],N) :- !, 
    dist(T,V,N).
dist([_|T],[_|V],N) :- 
    dist(T,V,M), 
    N is M+1.

primo(0,_,[]).
primo(N,[X|T],[X|V]) :-
    M is N-1,
    primo(M,T,V).


somma_pesata([],[]).
somma_pesata([D-C|T],[S-C|R]) :-
    delc(C,T,V,S1),
    (D>0, S is S1+1/(D*D); S is S1+1), !,
    somma_pesata(V,R).

delc(_,[],[],0).
delc(X,[D-X|T],V,S) :- !,
    delc(X,T,V,S1),
    (D>0, S is S1+1/(D*D); S is S1+1).
delc(X,[Y|T],[Y|V],N) :-
    delc(X,T,V,N).


max([X],X) :- !.
max([M-X|T],N-Y) :- 
    max(T,K-Z), 
    (M>K,N-Y=M-X; N-Y=K-Z), !.
	
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
	classifica_knn_pesato(Oggetto,51,malato), !,      % prevede correttamente la presenza di problemi cardiaci
	VNA1 is VNA + 1,
	valuta(Coda,VN,VNA1,VP,VPA,FN,FNA,FP,FPA,NC,NCA).
valuta([sano/Oggetto|Coda],VN,VNA,VP,VPA,FN,FNA,FP,FPA,NC,NCA) :-
	classifica_knn_pesato(Oggetto,51,sano), !, % prevede correttamente l'assenza di problemi cardiaci
	VPA1 is VPA + 1,
	valuta(Coda,VN,VNA,VP,VPA1,FN,FNA,FP,FPA,NC,NCA).
valuta([sano/Oggetto|Coda],VN,VNA,VP,VPA,FN,FNA,FP,FPA,NC,NCA) :-
	classifica_knn_pesato(Oggetto,51,malato), !,      % prevede erroneamente la presenza di problemi cardiaci
	FNA1 is FNA + 1,
	valuta(Coda,VN,VNA,VP,VPA,FN,FNA1,FP,FPA,NC,NCA).
valuta([malato/Oggetto|Coda],VN,VNA,VP,VPA,FN,FNA,FP,FPA,NC,NCA) :-
	classifica_knn_pesato(Oggetto,51,sano), !, % prevede erroneamente l'assenza di problemi cardiaci
	FPA1 is FPA + 1,
	valuta(Coda,VN,VNA,VP,VPA,FN,FNA,FP,FPA1,NC,NCA).
valuta([_/_|Coda],VN,VNA,VP,VPA,FN,FNA,FP,FPA,NC,NCA) :- % non classifica
	NCA1 is NCA + 1,
	valuta(Coda,VN,VNA,VP,VPA,FN,FNA,FP,FPA,NC,NCA1).


:- ensure_loaded(heart_database).

startt :-
    tell('heart_dataset.pl'),
	trova_attributi,
    starttt,
	tell('heart_attributi.pl'),
	trova_attributi,
	told.



starttt :-
	p(Age,Sex,Cp,Trestbps,Chol,Fbs,Restecg,Thalach,Exang,Oldpeak,Slope,Ca,Thal,0),
    write('e(sano,['),
    write('age = '),writeq(Age), write(', '),
	write('sex = '),writeq(Sex), write(', '),
	write('cp = '),writeq(Cp), write(', '),
    write('trestbps = '),writeq(Trestbps), write(', '),
    write('chol = '),writeq(Chol), write(', '),
    write('fbs = '),writeq(Fbs), write(', '),
    write('restecg = '),writeq(Restecg), write(', '),
    write('thalach = '),writeq(Thalach), write(', '),
    write('exang = '),writeq(Exang), write(', '),
    write('oldpeak = '),writeq(Oldpeak), write(', '),
    write('slope = '),writeq(Slope), write(', '),
	write('ca = '),writeq(Ca), write(', '),
    write('thal = '),writeq(Thal), writeln(']).'),
    fail.
starttt :-
	p(Age,Sex,Cp,Trestbps,Chol,Fbs,Restecg,Thalach,Exang,Oldpeak,Slope,Ca,Thal,1),
    write('e(malato,['),
    write('age = '),writeq(Age), write(', '),
	write('sex = '),writeq(Sex), write(', '),
	write('cp = '),writeq(Cp), write(', '),
    write('trestbps = '),writeq(Trestbps), write(', '),
    write('chol = '),writeq(Chol), write(', '),
    write('fbs = '),writeq(Fbs), write(', '),
    write('restecg = '),writeq(Restecg), write(', '),
    write('thalach = '),writeq(Thalach), write(', '),
    write('exang = '),writeq(Exang), write(', '),
    write('oldpeak = '),writeq(Oldpeak), write(', '),
    write('slope = '),writeq(Slope), write(', '),
	write('ca = '),writeq(Ca), write(', '),
    write('thal = '),writeq(Thal), writeln(']).'),
    fail.
	starttt :-
	p(Age,Sex,Cp,Trestbps,Chol,Fbs,Restecg,Thalach,Exang,Oldpeak,Slope,Ca,Thal,2),
    write('e(malato,['),
    write('age = '),writeq(Age), write(', '),
	write('sex = '),writeq(Sex), write(', '),
	write('cp = '),writeq(Cp), write(', '),
    write('trestbps = '),writeq(Trestbps), write(', '),
    write('chol = '),writeq(Chol), write(', '),
    write('fbs = '),writeq(Fbs), write(', '),
    write('restecg = '),writeq(Restecg), write(', '),
    write('thalach = '),writeq(Thalach), write(', '),
    write('exang = '),writeq(Exang), write(', '),
    write('oldpeak = '),writeq(Oldpeak), write(', '),
    write('slope = '),writeq(Slope), write(', '),
	write('ca = '),writeq(Ca), write(', '),
    write('thal = '),writeq(Thal), writeln(']).'),
    fail.
	starttt :-
	p(Age,Sex,Cp,Trestbps,Chol,Fbs,Restecg,Thalach,Exang,Oldpeak,Slope,Ca,Thal,3),
    write('e(malato,['),
    write('age = '),writeq(Age), write(', '),
	write('sex = '),writeq(Sex), write(', '),
	write('cp = '),writeq(Cp), write(', '),
    write('trestbps = '),writeq(Trestbps), write(', '),
    write('chol = '),writeq(Chol), write(', '),
    write('fbs = '),writeq(Fbs), write(', '),
    write('restecg = '),writeq(Restecg), write(', '),
    write('thalach = '),writeq(Thalach), write(', '),
    write('exang = '),writeq(Exang), write(', '),
    write('oldpeak = '),writeq(Oldpeak), write(', '),
    write('slope = '),writeq(Slope), write(', '),
	write('ca = '),writeq(Ca), write(', '),
    write('thal = '),writeq(Thal), writeln(']).'),
    fail.
	starttt :-
	p(Age,Sex,Cp,Trestbps,Chol,Fbs,Restecg,Thalach,Exang,Oldpeak,Slope,Ca,Thal,4),
    write('e(malato,['),
    write('age = '),writeq(Age), write(', '),
	write('sex = '),writeq(Sex), write(', '),
	write('cp = '),writeq(Cp), write(', '),
    write('trestbps = '),writeq(Trestbps), write(', '),
    write('chol = '),writeq(Chol), write(', '),
    write('fbs = '),writeq(Fbs), write(', '),
    write('restecg = '),writeq(Restecg), write(', '),
    write('thalach = '),writeq(Thalach), write(', '),
    write('exang = '),writeq(Exang), write(', '),
    write('oldpeak = '),writeq(Oldpeak), write(', '),
    write('slope = '),writeq(Slope), write(', '),
	write('ca = '),writeq(Ca), write(', '),
    write('thal = '),writeq(Thal), writeln(']).'),
    fail.
starttt :- told.

trova_attributi :-
	findall(Age,p(Age,A,B,C,D,E,F,G,H,I,L,M,N,O),AttributiAgeD),
	elimina_duplicati(AttributiAgeD,AttributiAge),
    write('a(age,'), writeq(AttributiAge), writeln(').'),
	
	findall(Sex,p(A,Sex,B,C,D,E,F,G,H,I,L,M,N,O),AttributiSexD),
	elimina_duplicati(AttributiSexD,AttributiSex),
    write('a(sex,'), writeq(AttributiSex), writeln(').'),
	
	findall(Cp,p(A,B,Cp,C,D,E,F,G,H,I,L,M,N,O),AttributiCpD),
	elimina_duplicati(AttributiCpD,AttributiCp),
    write('a(cp,'), writeq(AttributiCp), writeln(').'),
	
	findall(Trestbps,p(A,B,C,Trestbps,D,E,F,G,H,I,L,M,N,O),AttributiTrestbpsD),
	elimina_duplicati(AttributiTrestbpsD,AttributiTrestbps),
    write('a(trestbps,'), writeq(AttributiTrestbps), writeln(').'),
	
	findall(Chol,p(A,B,C,D,Chol,E,F,G,H,I,L,M,N,O),AttributiCholD),
	elimina_duplicati(AttributiCholD,AttributiChol),
    write('a(chol,'), writeq(AttributiChol), writeln(').'),
	
	findall(Fbs,p(A,B,C,D,E,Fbs,F,G,H,I,L,M,N,O),AttributiFbsD),
	elimina_duplicati(AttributiFbsD,AttributiFbs),
    write('a(fbs,'), writeq(AttributiFbs), writeln(').'),
	
	findall(Restecg,p(A,B,C,D,E,F,Restecg,G,H,I,L,M,N,O),AttributiRestecgD),
	elimina_duplicati(AttributiRestecgD,AttributiRestecg),
    write('a(restecg,'), writeq(AttributiRestecg), writeln(').'),
	
	findall(Thalach,p(A,B,C,D,E,F,G,Thalach,H,I,L,M,N,O),AttributiThalachD),
	elimina_duplicati(AttributiThalachD,AttributiThalach),
    write('a(thalach,'), writeq(AttributiThalach), writeln(').'),
	
	findall(Exang,p(A,B,C,D,E,F,G,H,Exang,I,L,M,N,O),AttributiExangD),
	elimina_duplicati(AttributiExangD,AttributiExang),
    write('a(exang,'), writeq(AttributiExang), writeln(').'),
	
	findall(Oldpeak,p(A,B,C,D,E,F,G,H,I,Oldpeak,L,M,N,O),AttributiOldpeakD),
	elimina_duplicati(AttributiOldpeakD,AttributiOldpeak),
    write('a(oldpeak,'), writeq(AttributiOldpeak), writeln(').'),
	
	findall(Slope,p(A,B,C,D,E,F,G,H,I,L,Slope,M,N,O),AttributiSlopeD),
	elimina_duplicati(AttributiSlopeD,AttributiSlope),
    write('a(slope,'), writeq(AttributiSlope), writeln(').'),
	
	findall(Ca,p(A,B,C,D,E,F,G,H,I,L,M,Ca,N,O),AttributiCaD),
	elimina_duplicati(AttributiCaD,AttributiCa),
    write('a(ca,'), writeq(AttributiCa), writeln(').'),
	
	findall(Thal,p(A,B,C,D,E,F,G,H,I,L,M,N,Thal,O),AttributiThalD),
	elimina_duplicati(AttributiThalD,AttributiThal),
    write('a(thal,'), writeq(AttributiThal), writeln(').'),
	
	findall(Target,p(A,B,C,D,E,F,G,H,I,L,M,N,O,Target),AttributiTargetD),
	elimina_duplicati(AttributiTargetD,AttributiTarget),
    write('a(target,'), writeq(AttributiTarget), writeln(').').
	
	
elimina_duplicati([], []).

elimina_duplicati([Testa | Coda], Risultato) :-
    member(Testa, Coda), !,
    elimina_duplicati(Coda, Risultato).

elimina_duplicati([Testa | Coda], [Testa | Risultato]) :-
    elimina_duplicati(Coda, Risultato).
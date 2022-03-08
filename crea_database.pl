/*
* paziente(age,sex,cp,trestbps,chol,fbs,restecg,thalach,exang,oldpeak,slope,ca,thal,target)
* 
* age = età del paziente
* sex = (1 = maschio; 0 = femmina)
* cp = tipo di dolore al petto (0 = typical angina; 1 = atypical angina; 2 = non-anginal pain; 3 = asymptomatic)
* trestbps = pressione sanguigna a riposo (in mm Hg al ricovero in ospedale)
* chol = colesterolo sierico in mg/dl
* fbs = (glicemia a digiuno>120 mg/dl) (1 = vero; 0 = falso)
* restecg = risultati elettrocardiografici a riposo
* thalach = frequenza cardiaca massima raggiunta
* exang = angina indotta da esercizio (1 = sì; 0 = no)
* oldpeak = depressione ST indotta dall'esercizio rispetto al riposo
* slope = la pendenza del segmento ST di picco di esercizio
* ca = numero di vasi principali (0-3) colorati da fluoroscopia
* thal = risultato del test da sforzo al tallio (difetto normale, fisso o reversibile)
* target = (0 = non c'è una malattia cardiaca significativa altrimenti c'è)
*
*
*/

:- use_module(library(csv)).


start :-
	import,
    tell('heart_database.pl'),
	paziente(Age,Sex,Cp,Trestbps,Chol,Fbs,Restecg,Thalach,Exang,Oldpeak,Slope,Ca,Thal,Target),
    write('p('),(number(Age), Age>=0, Age<21, write(tra0e20);
				 number(Age), Age>20, Age<31, write(tra21e30);
				 number(Age), Age>30, Age<41, write(tra31e40);
				 number(Age), Age>40, Age<51, write(tra41e50);
				 number(Age), Age>50, Age<61, write(tra51e60);
				 number(Age), Age>60, Age<71, write(tra61e70);
				 number(Age), Age>70, Age<81, write(tra71e80);
				 number(Age), Age>80, Age<91, write(tra81e90);
				 number(Age), Age>90, Age<101, write(tra91e100);
				 \+ number(Age), Age == ?, write('sconosciuto')
	), 
    write(','), (number(Sex), Sex==1, write('maschio');
				number(Sex), Sex==0, write('femmina');
				\+ number(Sex), Sex == ?, write('sconosciuto')
				),
    write(','), (number(Cp), Cp==1, write('angina_tipica');
				number(Cp), Cp==2, write('angina_atipica');
				number(Cp), Cp==3, write('dolore_non_da_angina');
				number(Cp), Cp==4, write('asintomatico');
				\+ number(Cp), Cp == ?, write('sconosciuto')
				),
	write(','), (number(Trestbps), Trestbps<50, write('pressione_bassa_pericolosa');
				 number(Trestbps), Trestbps>=50, Trestbps<60, write('pressione_troppo_bassa');
				 number(Trestbps), Trestbps>=60, Trestbps<70, write('pressione_bassa_1');
				 number(Trestbps), Trestbps>=70, Trestbps<80, write('pressione_bassa_2');
				 number(Trestbps), Trestbps>=80, Trestbps<90, write('pressione_bassa_3');
				 number(Trestbps), Trestbps>=90, Trestbps<115, write('pressione_normale');
				 number(Trestbps), Trestbps>=115, Trestbps<130, write('pressione_accettabile');
				 number(Trestbps), Trestbps>=130, Trestbps<140, write('pre_ipertensione');
				 number(Trestbps), Trestbps>=140, Trestbps<160, write('ipertensione_stadio_1');
				 number(Trestbps), Trestbps>=160, Trestbps<180, write('ipertensione_stadio_2');
				 number(Trestbps), Trestbps>=180, write('crisi_ipertensiva');
				 \+ number(Trestbps), Trestbps == ?, write('sconosciuto')
				),
	write(','), (number(Chol), Chol<200, write('colesterolo_min_200');
				 number(Chol), Chol>=200, Chol<221, write('colesterolo_200_220');
				 number(Chol), Chol>=221, Chol<241, write('colesterolo_221_240');
				 number(Chol), Chol>=241, Chol<261, write('colesterolo_241_260');
				 number(Chol), Chol>=261, Chol<281, write('colesterolo_261_280');
				 number(Chol), Chol>=281, Chol<301, write('colesterolo_281_300');
				 number(Chol), Chol>=301, Chol<321, write('colesterolo_301_320');
				 number(Chol), Chol>=321, Chol<341, write('colesterolo_321_340');
				 number(Chol), Chol>=341, Chol<361, write('colesterolo_341_360');
				 number(Chol), Chol>=361, Chol<381, write('colesterolo_361_380');
				 number(Chol), Chol>=381, Chol<401, write('colesterolo_381_400');
				 number(Chol), Chol>=401, Chol<421, write('colesterolo_401_420');
				 number(Chol), Chol>=421, Chol<441, write('colesterolo_421_440');
				 number(Chol), Chol>=441, Chol<461, write('colesterolo_441_460');
				 number(Chol), Chol>=461, Chol<481, write('colesterolo_461_480');
				 number(Chol), Chol>=481, Chol<501, write('colesterolo_481_500');
				 number(Chol), Chol>=500, write('colesterolo_mag_500');
				 \+ number(Chol), Chol == ?, write('sconosciuto')
				 ),
	write(','), (number(Fbs), Fbs==1, write('glicemia_mag_120');
				number(Fbs), Fbs==0, write('glicemia_min_120');
				\+ number(Fbs), Fbs == ?, write('sconosciuto')
				),
    write(','), (number(Restecg), write(Restecg);
				\+ number(Restecg), Restecg == ?, write('sconosciuto')
				),
	write(','), (number(Thalach), TCorretto is integer(Thalach)//10, write('classe'), write(TCorretto);
				\+ number(Thalach), Thalach == ?, write('sconosciuto')
				),
	write(','), (number(Exang), write(Exang);
				\+ number(Exang), Exang == ?, write('sconosciuto')
				),
	write(','), (number(Oldpeak), Oldpeak<(-0.5), write('decremento');
				 number(Oldpeak), Oldpeak>=(-0.5), Oldpeak<0, write('decremento_lieve');
				 number(Oldpeak), Oldpeak=0, write('invariato');
				 number(Oldpeak), Oldpeak>0, Oldpeak=<0.5, write('incremento_lieve');
				 number(Oldpeak), Oldpeak>0.5, write('incremento');
				 \+ number(Oldpeak), Oldpeak == ?, write('sconosciuto')
				),
    write(','), (number(Slope), write(Slope);
				\+ number(Slope), Slope == ?, write('sconosciuto')
				),
	write(','), (number(Ca), write(Ca);
				\+ number(Ca), Ca == ?, write('sconosciuto')
				),
	write(','), (number(Thal), write(Thal);
				\+ number(Thal), Thal == ?, write('sconosciuto')
				),
	write(','), (number(Target), write(Target);
				\+ number(Target), Target == ?, write('sconosciuto')
				),
    writeln(').'),
    fail.
start :- told.

import:-
	csv_read_file('heart2.csv', Data, [functor(paziente), arity(14), skip_header(#), encoding(utf8)]),
          maplist(assert,Data).
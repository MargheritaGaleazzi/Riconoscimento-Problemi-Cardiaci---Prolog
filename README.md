# Riconoscimento-Problemi-Cardiaci---Prolog
Analisi di un dataset di pazienti mediante un programma scritto in Prolog per il riconoscimento di problemi cardiaci

# Progetto Intelligenza Artificiale  
Il contenuto del repository è un insieme di programmi prolog che utilizzano differenti approcci e algoritmi di machine learning, per provare a predirre la classe di appartenenza (malato o sano) di un paziente.
## Il dataset di riferimento
[https://archive.ics.uci.edu/ml/datasets/heart+disease](https://archive.ics.uci.edu/ml/datasets/heart+disease)

I dati con cui si è costruito il dataset sono stati estratti dai dataset processati presenti nel link sopra.

Ai fini di avere un dataset consistente ho provveduto ad unire insieme tutti i dataset processati provenienti dalle varie organizzazioni. Il file contenente tale unione è visibile nella cartella ed ha il nome **heart2.csv**
## I dati
I dati presenti nel dataset sono:
- age = età del paziente 
 - sex = (1 = maschio; 0 = femmina) 
 - cp = tipo di dolore al petto (0 = anigina tipica; 1 = angina atipica; 2 = dolore    non da angina; 3 = asintomatico) 
  - trestbps = pressione sanguigna a riposo (in mmHg al ricovero in ospedale) 
  - chol = colesterolo sierico in mg/dl fbs = (glicemia a digiuno>120 mg/dl) (1 = vero; 0 = falso)
  - restecg = risultati  dell’elettrocardiogramma a riposo 
  - thalach = frequenza cardiaca massima raggiunta exang = angina indotta da    esercizio (1 = sì; 0 = no) 
  - oldpeak = depressione ST indotta dall'esercizio rispetto al riposo 
  - slope = la pendenza del segmento ST di picco di esercizio 
  - ca = numero di vasi principali (0-3) colorati da fluoroscopia 
  - thal = risultato del test da sforzo al tallio 
  - target= (0 = non c'è una malattia cardiaca significativa, altrimenti c'è)
## La RoadMap
![RoadMap](https://github.com/MargheritaGaleazzi/Riconoscimento-Problemi-Cardiaci---Prolog/blob/main/img/roadmap.png)
## I risultati ottenuti
Con il dataset a disposizione i risultati ottenuti sono quelli riportati di seguito.
> Bisogna però notare che con l'algoritmo di induzione dell'albero e con le due differenti implementazioni dell'algoritmo per l'induzione delle regole, si hanno dei casi non classificati quindi l'accuratezza che si ha in realtà è notevolmente inferiore.

**Induzione Regole con attributi valorizzati a sconosciuto**
![Risultati induzioni regole sconosciuto](https://github.com/MargheritaGaleazzi/Riconoscimento-Problemi-Cardiaci---Prolog/blob/main/img/ris_ind_scon.png)

**Induzione Regole senza attributi valorizzati a sconosciuto**
Questo algoritmo a differenza del precedente non asserisce regole su attributi che hanno come valore "Sconosciuto".
![Risultati induzioni regole](https://github.com/MargheritaGaleazzi/Riconoscimento-Problemi-Cardiaci---Prolog/blob/main/img/ris_ind_not.png)

**Induzione Albero Decisionale**
![Risultati induzione albero](https://github.com/MargheritaGaleazzi/Riconoscimento-Problemi-Cardiaci---Prolog/blob/main/img/ris_ind_alb.png)

**Bayes Naive**
![Risultati Bayes Naive](https://github.com/MargheritaGaleazzi/Riconoscimento-Problemi-Cardiaci---Prolog/blob/main/img/ris_bayes.png)

**KNN**
![Risultati KNN](https://github.com/MargheritaGaleazzi/Riconoscimento-Problemi-Cardiaci---Prolog/blob/main/img/ris_knn.png)

**KNN Pesato**
![Risultati KNN_Pesato](https://github.com/MargheritaGaleazzi/Riconoscimento-Problemi-Cardiaci---Prolog/blob/main/img/ris_knnP.png)

**Paragoni:**
![Grafico1](https://github.com/MargheritaGaleazzi/Riconoscimento-Problemi-Cardiaci---Prolog/blob/main/img/grafico1.png)
![Grafico2](https://github.com/MargheritaGaleazzi/Riconoscimento-Problemi-Cardiaci---Prolog/blob/main/img/grafico2.png)

**Chiarezza sui termini (Vero Positivo, Falso Positivo, Vero Negativo, Falso Negativo)**
![Tabella](https://github.com/MargheritaGaleazzi/Riconoscimento-Problemi-Cardiaci---Prolog/blob/main/img/tabella.png)

## Autore
Margherita Galeazzi -> https://github.com/MargheritaGaleazzi

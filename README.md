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
# La RoadMap
![RoadMap](https://github.com/MargheritaGaleazzi/Riconoscimento-Problemi-Cardiaci---Prolog/blob/main/img/roadmap.png)


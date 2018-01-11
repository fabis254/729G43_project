# Den här filen kör de terminal-kommandon som jag har använt i min implementation.
# OBS: För att kunna köra den här filen måste du befinna dig i "ripper_implementation" mappen! Annars fungerar inte anropen som de skall.
# Det finns tre olika testkörningar som görs här, alla på samma datamängd:
#       ;; Schlimmer, J. (1987). UCI Machine Learning Repository. 
# 		;; Irvine, CA: University of California, School of Information and Computer Science.
# 		;; Hämtad Januari 04, 2018, från https://archive.ics.uci.edu/ml/datasets/Congressional Voting Records
#
# För mer information om vilka som utför RIPPERk algoritmen, läs README.txt.
# Koden har jag hämtat från: 
#			;; https://github.com/azampagl/ai-ml-ripperk
# 
# Här är förklaringar av de argument som skickas i terminalkommandona nedanför i den här filen (mina kommentarer står med ";;":
# ============================================
# Arguments for python ripperk.py
# ============================================
#
#	The following parameters are required in all phases:
#
# 	-e: the execution method (learn|classify)
# 			;; Inlärning och klassifiering sker med olika anrop.
# 	-a: the attribute file location.
# 			;; Attributen och dess möjliga värden läses in från fil, i mitt fall filen "house-votes-attr.txt".
#			;; Titta gärna på filen!
# 	-c: the defining attribute in the attribute file (a.k.a what we are trying to predict).
#			;; I mitt fall så försöker algoritmen förutsäga om en datainstans är "republikan" eller "demokrat".
#			;; Alltså attributet "Party"
# 	-t: the training/testing file location.
#			;; Träningsfilen heter "house-votes-train.txt". Testfilen heter "house-votes-test.txt".
# 	-m: the model file (machine readable results).
# 			;; Det här är de slutgiltiga reglerna som algoritmen kommer fram till efter träningen är klar.
# 	-o: the output file (human readable results).
#			;; Samma innehåll som ovan fast skrivet med "IF, THEN" för läsbarhet
#
#	The following are arguments are optional during the learn phase:
#
#	-k: the number of optimizations (default is 2).
#			;; Lägg märke till att jag ändrar det här argumentet i olika körningar
#	-p: pruning or no pruning [1 or 0] (default is 1).
#			;; Likväl kommer pruning sättas av och på
# ============================================
#
#
# Först och främst så delas data upp i en träningsmängd och en testmängd.
# Träningsmängden är 90% av alla data. Testmängden är 10%. Se translate.py för mer info.
python src/translate.py

# Det hade definitivt varit intressant att variera kvoten test till träningsdata men p.g.a tidsbrist valde jag att bortse från det.
# Jag upplevde inte att det fanns någon särskild poäng jag ville föra fram med det i rapporten, den handlade mer om nack/fördelar med
# pruning och optimeringen som RIPPERk utför.

# Alla experiment nedaför körs på samma tränings och testdata med samma attribut. Klassen vi försöker förutsäga är alltid Party.
# Det som ändras är användningen av pruning och optimering. Notera också att alla modeller som skapas har olika namn, 
# experiment 1 --> "house-votes-experiment-1-model.dat" / "house-votes-experiment-1-model.txt". 
# Filerna hittar du i mapparna "data" och "results".
# TIPS: sätt på Word-wrap i din texteditor om du inte redan har det så att du slipper scrolla för att se anropen nedan,
# sh formatet tillåter inte radbryt inom ett anrop.

# ============================================
# Experiment 1: ingen pruning ingen optimering. 
python2 src/ripperk.py -e learn -a "./data/house-votes-84-attr.txt" -c Party -t "./data/house-votes-train.txt" -m "./results/house-votes-experiment-1-model.dat" -o "./results/house-votes-experiment-1-model.txt" -k 0 -p 0

echo "Experiment 1: ingen pruning ingen optimering."
python2 src/ripperk.py -e classify -a "./data/house-votes-84-attr.txt" -c Party -t "./data/house-votes-test.txt" -m "./results/house-votes-experiment-1-model.dat" -o "./results/house-votes-experiment-1-model.txt"
# ============================================

# ============================================
# Experiment 2: pruning, ingen optimering.
python2 src/ripperk.py -e learn -a "./data/house-votes-84-attr.txt" -c Party -t "./data/house-votes-train.txt" -m "./results/house-votes-experiment-2-model.dat" -o "./results/house-votes-experiment-2-model.txt" -k 0 -p 1

echo "Experiment 2: pruning, ingen optimering."
python2 src/ripperk.py -e classify -a "./data/house-votes-84-attr.txt" -c Party -t "./data/house-votes-test.txt" -m "./results/house-votes-experiment-2-model.dat" -o "./results/house-votes-experiment-2-model.txt"
# ============================================

# ============================================
# Experiment 3: pruning, optimering (k=1).
python2 src/ripperk.py -e learn -a "./data/house-votes-84-attr.txt" -c Party -t "./data/house-votes-train.txt" -m "./results/house-votes-experiment-3-model.dat" -o "./results/house-votes-experiment-3-model.txt" -k 1 -p 1

echo "Experiment 3: pruning, optimering (k=1)"
python2 src/ripperk.py -e classify -a "./data/house-votes-84-attr.txt" -c Party -t "./data/house-votes-test.txt" -m "./results/house-votes-experiment-3-model.dat" -o "./results/house-votes-experiment-3-model.txt"
# ============================================

# ============================================
# Experiment 4: pruning, optimering (k=2).
python2 src/ripperk.py -e learn -a "./data/house-votes-84-attr.txt" -c Party -t "./data/house-votes-train.txt" -m "./results/house-votes-experiment-4-model.dat" -o "./results/house-votes-experiment-4-model.txt" -k 2 -p 1

echo "Experiment 4: pruning, optimering (k=2)"
python2 src/ripperk.py -e classify -a "./data/house-votes-84-attr.txt" -c Party -t "./data/house-votes-test.txt" -m "./results/house-votes-experiment-4-model.dat" -o "./results/house-votes-experiment-4-model.txt"
# ============================================

# ============================================
# Experiment 5: pruning, optimering (k=3).
python2 src/ripperk.py -e learn -a "./data/house-votes-84-attr.txt" -c Party -t "./data/house-votes-train.txt" -m "./results/house-votes-experiment-5-model.dat" -o "./results/house-votes-experiment-5-model.txt" -k 3 -p 1

echo "Experiment 5: pruning, optimering (k=3)"
python2 src/ripperk.py -e classify -a "./data/house-votes-84-attr.txt" -c Party -t "./data/house-votes-test.txt" -m "./results/house-votes-experiment-5-model.dat" -o "./results/house-votes-experiment-5-model.txt"
# ============================================

# ============================================
# Experiment 6: ingen pruning, optimering (k=3).
python2 src/ripperk.py -e learn -a "./data/house-votes-84-attr.txt" -c Party -t "./data/house-votes-train.txt" -m "./results/house-votes-experiment-6-model.dat" -o "./results/house-votes-experiment-6-model.txt" -k 3 -p 0

echo "Experiment 6: ingen pruning, optimering (k=3)"
python2 src/ripperk.py -e classify -a "./data/house-votes-84-attr.txt" -c Party -t "./data/house-votes-test.txt" -m "./results/house-votes-experiment-6-model.dat" -o "./results/house-votes-experiment-6-model.txt"
# ============================================

# Vänligen,
# Fabian Isaksson
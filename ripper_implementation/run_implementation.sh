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
# Träningsmängden är 1/3 av alla data. Testmängden är 1/3. Se translate.py för mer info.
python src/translate.py

# KÖRNING 1: 
python2 src/ripperk.py -e learn -a "../data/house-votes-84-attr.txt" -c Party -t "../data/house-votes-train.txt" -m "../results/house-votes-model.dat" -o "../results/house-votes-model.txt" -k 2 -p 1

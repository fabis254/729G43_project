# Den här koden tar någonting som har kommatecken istället för mellanrum
# ' ' som separatorer och anpassar datan för att användas i ripperk.py.
# Dessutom så delas datan upp i träning och testdata.

# Datafilen som skall anpassas
data = "../data/house-votes-84.txt"

f = open(data, "r")
lines = f.readlines()
new_list = []			# Texten placeras först i en lista för att vara enklare att hantera
						# än att skriva direkt till fil.
for line in lines: 
	new_list.append(line.replace(",", " "))
f.close()

# Här delas datan också upp i trännings och testdata
# Träningsmängden är här alltså första 66% av datan.
train = new_list[:-int(len(new_list)*0.66)]

# Återstående 33% är testdata
test = new_list[int(len(new_list)*0.33):]

# Sedan skrivs allt till två filer, en med träningsdata... 
tr = open("../data/house-votes-train.txt", "w")
tr.writelines(train)
tr.close()
# en med testdata...
ts = open("../data/house-votes-test.txt", "w")
ts.writelines(test)
ts.close()
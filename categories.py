import csv

dic = {}
list = []

with open("dict_key.csv", mode = 'r') as file:
    csvFile = csv.reader(file)
    for lines in csvFile:
        list.append(lines)
print(list)

dic = {(i[0]): i[1] for i in list}
print(dic)

studyList = []


with open ("studies.csv", mode = 'r') as file:
    csvFile = csv.reader(file)
    for lines in csvFile:
        studyList.append(lines)

print(studyList)
for i in studyList:
    if str(i) in dic:
        print(dic[str(i)])
dic["perception of birds"]
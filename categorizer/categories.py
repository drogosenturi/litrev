import csv

#make blank dictionary and list
dic = {}
list = []
#import csv
with open("dict_key.csv", mode = 'r') as file:
    csvFile = csv.reader(file)
    for lines in csvFile:
        list.append(lines)
print(list)
#create dictionary from csv list
dic = {(i[0]): i[1] for i in list}
print(dic)

studyList = []

#import csv containing study info
with open ("studies.csv", mode = 'r') as file:
    csvFile = csv.reader(file)
    for lines in csvFile:
        studyList.append(lines)

print(studyList)
str(studyList)
dic['acceptability']

#function to replace values in study list with dictionary values
def dicreplace():
    oldlist = studyList
    for i in dic:
        if i in str(oldlist):
            replacement = f'{i}'
            #print(dic[str(i)])
            oldlist = str(oldlist).replace(i,dic[replacement])
        else:
            oldlist = str(oldlist).replace(i,'')
    return oldlist

#function to clean out anything that's labeled "remove"
def clean(dirty):
#    for i in dic:
#        if i not in (dirty):
#            new = str(dirty).replace(i,'')
    if "REMOVE" in str(dirty):
        new = str(dirty).replace("REMOVE", '')
    return new

newlist = []
newlist = dicreplace()
print(newlist)

cleanlist = clean(newlist)
cleanlist = eval(cleanlist)
type(cleanlist)
print(cleanlist)

#output to csv
with open('social_variables.csv', 'w', newline = '') as f:
    writer = csv.writer(f)
    writer.writerows(cleanlist)
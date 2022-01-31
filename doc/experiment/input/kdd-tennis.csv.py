import ast
import pandas as pd
import dateutil
list_of_dict = []
with open('./data/kdd-tennis.txt') as f:
    for line in f:
        list_of_dict.append(ast.literal_eval(line))


df = pd.DataFrame(list_of_dict)
df.to_csv("kdd-tennis.csv")


import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt
import numpy as np
import matplotlib

gapminder = pd.read_csv("file_name.csv") #insert file name with file in csv format
print(gapminder.head(3))
df2 = gapminder[['CellType', 'geneName', 'L2FC']] #L2FC is replaced with vstpK for VSTPk values
heatmap1_data_work = pd.pivot_table(df2, values='L2FC', index='geneName', columns='CellType')
matplotlib.pyplot.figure(figsize=(50, 92))
sns.set(font_scale=2)

sns.clustermap(heatmap1_data_work, vmin=('0'), vmax=('20'), col_cluster=False, cmap='YlGnBu', cbar_kws=None, figsize=(15, 30))

plt.yticks(rotation=0.5, fontsize=10)
plt.xticks(fontsize=15)

ylabel=("Gene Name")
xlabel=("Cell Type")
plt.ylabel(ylabel, fontsize=15)
plt.xlabel(xlabel, fontsize=15)
# label plot title and file name with whatever
plt.title(label='plot_title', fontsize=20) 

plt.savefig(fname='plot_title.svg', format='svg')
plt.savefig('plot_title.svg')

plt.show()
plt.close()

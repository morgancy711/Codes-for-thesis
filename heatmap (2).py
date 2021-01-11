import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt
import numpy as np
import matplotlib
gapminder = pd.read_csv("TN and CD11b all secreted genes.csv")
print(gapminder.head(3))
df1 = gapminder[['CellType', 'geneName', 'L2FC']]
print(df1.head())
heatmap1_data = pd.pivot_table(df1, values='L2FC', index='geneName', columns='CellType')
matplotlib.pyplot.figure(figsize=(100, 184))
my_dpi = 96
sns.set(font_scale=2)

plt.figure(figsize=(2016 / my_dpi, 9120 / my_dpi), dpi=my_dpi)
sns.clustermap(heatmap1_data, vmin=('-6'), vmax=('6.1'), col_cluster=False, cmap="vlag", cbar_kws=None, figsize=(30, 30))
plt.yticks(rotation=0.5, fontsize=15)
plt.xticks(fontsize=15)

ylabel=("Gene Name")
xlabel=("Cell Type")
plt.ylabel(ylabel, fontsize=15)
plt.xlabel(xlabel, fontsize=15)

plt.title(label='TN and CD11b all secreted genes', fontsize=20)

plt.show()
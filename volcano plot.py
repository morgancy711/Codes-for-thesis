import pandas as pd
from bioinfokit import visuz
df = pd.read_csv("CD11b diff ex. secreted genes vs PBS.csv")
df.head()
visuz.gene_exp.volcano(d=df, lfc= "L2FC", pv="p-value", color=('#E10600FF','#00239CFF'), gstyle=2,  sign_line=True)

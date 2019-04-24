import pandas as pd
import geopandas as gpd
import matplotlib.pyplot as plt

# Read & Create MapDF
map_df = gpd.read_file('build/mgm2010v5_0a.shp')

# Config MapDF

# Create figure and axes for Matplotlib
# fig, ax = plt.subplots(1, figsize=(10, 6))

## Remove axis
# ax.axis('off')
## Add Title
# ax.set_title("Crecimiento Anual según PIB en México", fontdict={'fontsize': '25', 'fontweight': '3'})

# Plot MapDF
map_df.plot()
plt.show()
import matplotlib.pyplot as plt
import seaborn as sns
import pandas as pd
from matplotlib.colors import LinearSegmentedColormap

# Load data
file_path = '/path/to/your/data.csv'  # Change to your file path
data = pd.read_csv(file_path)
databases = data['database'].unique()

# Create plot layout
fig, axes = plt.subplots(nrows=3, ncols=2, figsize=(20, 20), gridspec_kw={'bottom': 0.1})

# Set color map
cmap = LinearSegmentedColormap.from_list("custom_orange_blue", ["#eb7d21", "#3d67a9"])

# Plot stacked bar charts, remove grid lines
for ax, db in zip(axes.flatten()[:5], databases[:5]):
    db_data = data[data['database'] == db]
    pivot_data = db_data.pivot_table(index='cs', columns='classify', values='abundance', aggfunc='mean', fill_value=0)
    pivot_data.plot(kind='bar', stacked=True, ax=ax, color=['#3d67a9', '#eb7d21'], legend=False)
    ax.set_title(f'Average Abundance by CS for Database: {db}', fontsize=14)
    ax.set_xlabel('CS', fontsize=12)
    ax.set_ylabel('Average Abundance', fontsize=12)
    ax.grid(False)  # Disable grid

# Plot GTDB202 stacked bar chart, remove grid lines
pivot_gtdb202 = data[data['database'] == 'GTDB202'].pivot_table(index='cs', columns='classify', values='abundance', aggfunc='mean', fill_value=0)
pivot_gtdb202.plot(kind='bar', stacked=True, ax=axes[2, 0], color=['#3d67a9', '#eb7d21'], legend=False)
axes[2, 0].set_title('Average Abundance by CS for Database: GTDB202', fontsize=14)
axes[2, 0].set_xlabel('CS', fontsize=12)
axes[2, 0].set_ylabel('Average Abundance', fontsize=12)
axes[2, 0].grid(False)

# Plot heatmap, remove color bar
sns.heatmap(data[data['classify'] == 'classified'].pivot_table(index='database', columns='cs', values='abundance', aggfunc='mean', fill_value=0),
            annot=True, cmap=cmap, fmt=".2f", ax=axes[2, 1], cbar=False)
axes[2, 1].set_title('Average Abundance by Database and CS (Classified)', fontsize=16)
axes[2, 1].set_xlabel('CS', fontsize=14)
axes[2, 1].set_ylabel('Database', fontsize=14)

# Add unified legend
fig.legend(['Classified', 'Unclassified'], loc='lower center', ncol=2, title='Classify')

plt.tight_layout()

# Export plots as PNG and SVG
fig_path_png = "/mnt/data/combined_charts.png"
fig_path_svg = "/mnt/data/combined_charts.svg"
fig.savefig(fig_path_png, format='png', dpi=300)  # Export as PNG
fig.savefig(fig_path_svg, format='svg')  # Export as SVG

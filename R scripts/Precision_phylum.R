# Load required packages
library(ggplot2)
library(dplyr)
library(showtext)

# Read data
df <- read.csv("precision-phylum-cs.csv")

# Convert data from wide to long format for ggplot2
df_long <- reshape2::melt(df, id.vars = "confidence", variable.name = "Database", value.name = "Precision")

df_long <- df_long %>%
  mutate(Database = recode(Database,
                           'mini' = 'Minikraken',
                           'standard-16' = 'Standard-16',
                           'standard' = 'Standard',
                           'nt' = 'nt',
                           'GTDB' = 'GTDB r202'))

# Plot boxplot
ggplot(df_long, aes(x = Database, y = Precision, fill = confidence)) +
  geom_boxplot(outlier.shape = NA) +
  facet_wrap(~ Database, scales = "free_x", nrow = 1) +  # Facet by Database
  scale_fill_manual(values = c("CS0" = "#1F77B4",
                               "CS0.2" = "#FF7F0E",
                               "CS0.4" = "#2CA02C",
                               "CS0.6" = "#D62728",
                               "CS0.8" = "#9467BD",
                               "CS1.0" = "#8C564B"),
                    labels = c("0", "0.2", "0.4", "0.6", "0.8", "1.0")) +  # Correctly assign labels
  theme(panel.background = element_rect(fill = "white"),  # Set background to white
        panel.grid.major = element_blank(),  # Remove major grid lines
        panel.grid.minor = element_blank(),  # Remove minor grid lines
        panel.border = element_rect(colour = "black", fill=NA, size=1),  # Add border
        axis.title.x = element_blank(),  # Customize X axis label font size and style
        axis.title.y = element_text(size = 16, face = "bold"),  # Customize Y axis label font size and style
        axis.ticks.x = element_blank(),
        axis.text.x = element_blank(),  # Customize X axis tick text size
        axis.text.y = element_text(size = 10, colour = "black"),   # Customize Y axis tick text size
        legend.box.just = "right",  # Right-align legend box
        legend.title = element_text(face = "bold", size = 10, family = "Times New Roman"),  # Customize legend title font and size
        legend.text = element_text(size = 10, family = "Times New Roman"),
        strip.text.x = element_text(size = 14, face = "bold", family = "Times New Roman", color = "black")) +  # Modify facet labels font size and style
  labs(title = " ",
       x = " ",
       y = "Precision",
       fill = "Confidence score") 

font_add('Times New Roman','/Library/Fonts/Arial.ttf')
showtext_auto()

# Install required packages
install.packages("ggplot2")
install.packages("dplyr")
install.packages("tidyr")

# Load packages
library(ggplot2)
library(dplyr)
library(tidyr)
library(RColorBrewer)

# Read data
data <- read.csv("composition.csv")  
data <- data %>%
  mutate(species = replace(species, species == "others", "bbb"))

# Data preprocessing
data <- data %>%
  mutate(
    database = factor(database, levels = c("minikraken", "standard16", "standard", "nt", "GTDB202")),
    abundance = as.numeric(abundance),  # Convert to numeric
    cs = as.character(cs),  # Ensure cs column is character
    cs = ifelse(cs == "9", "True", cs),  # Replace specific values
    cs = factor(cs, levels = c("True", "0", "0.2", "0.4", "0.6", "0.8", "1"))  # Convert to factor and specify levels
  ) %>%
  filter(abundance > 0)  # Filter out rows with abundance <= 0

# Calculate total abundance and sort
species_abundance <- data %>%
  group_by(species) %>%
  summarize(total_abundance = sum(abundance)) %>%
  arrange(desc(total_abundance))

# Extract top 11 species
top_species <- species_abundance$species[1:11]

# Define colors
top_colors <- c("#831b52", "#386325", "#ffff99", "#b15928", "#ff7f00", "#e31a1c", "#a6cee3", "#33a02c", "#1f78b4", "#fb9a99", "#fdbf6f")
additional_species <- setdiff(unique(data$species), c(top_species, "others"))
additional_colors <- colorRampPalette(brewer.pal(9, "Set3"))(length(additional_species))

# Create color vector, set "others" to black
color_vector <- setNames(c(top_colors, additional_colors, "black"), c(top_species, additional_species, "others"))

# Plot stacked bar chart
ggplot(data, aes(x = cs, y = abundance, fill = species)) +
  geom_bar(stat = "identity", position = "stack", show.legend = TRUE) +
  facet_grid(. ~ database, scales = "free_x", space = "free_x") +
  labs(x = "Confidence Score", y = "The relative abundance", title = " ") +
  theme_minimal(base_family = "Helvetica") +
  theme(
    axis.title.x = element_text(color = "black", size = 14),
    axis.title.y = element_text(color = "black", size = 16),
    axis.text.x = element_text(angle = 0, vjust = 0, color = "black", size = 12),
    axis.text.y = element_text(angle = 0, vjust = 0, color = "black", size = 12),
    strip.background = element_rect(fill = "gray80", colour = "black", size = 1),
    strip.text.x = element_text(size = 12, face = "bold", color = "black"),
    panel.border = element_rect(colour = "black", fill = NA, size = 1),
    panel.background = element_rect(fill = "white", colour = NA),  # Adjust background color
    panel.grid.major = element_line(color = "white"),  # Adjust major grid line color
    panel.grid.minor = element_blank(),  # Hide minor grid lines
    plot.margin = unit(c(1, 1, 1, 1), "cm"),  # Adjust plot margins
    legend.text = element_text(size = 12),  # Adjust legend text size
    legend.key.size = unit(0.5, "cm")  # Adjust legend key size
  ) +
  scale_fill_manual(values = color_vector) +
  guides(fill = guide_legend(ncol = 2)) +  # Set legend to two columns
  scale_y_continuous(limits = c(0, 1.001), breaks = seq(0, 1.001, by = 0.1))

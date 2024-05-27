# Load necessary libraries
library(ggplot2)
library(readxl)
library(dplyr)

# Minikraken database

data <- relevant_data_species  # Replace with the actual data variable

# Convert to percentage and log10 scale
data$abundance <- log10(data$abundance * 100 + 1)

# Extract data for different confidence scores
no_data <- subset(data, cs == "no")
one_data <- subset(data, cs == "one")

# Align data by 'species' and 'sample'
merged_data <- merge(no_data, one_data, by = c("species", "sample"), suffixes = c("_no", "_one"))

# Plot scatter plot minikraken-0-species
ggplot(merged_data, aes(x = abundance_no, y = abundance_one)) +
  geom_point(colour = "black", size = 4) +
  geom_abline(slope = 1, intercept = 0, color = "red", linetype = "dashed", linewidth = 1) +
  theme_classic() +
  theme(panel.border = element_rect(fill = NA, linewidth = 0.5, linetype = "solid"),
        plot.background = element_blank(),
        axis.text.x = element_text(size = 16, face = "bold", colour = "black"), 
        axis.text.y = element_text(size = 16, face = "bold", colour = "black"),  
        legend.title = element_blank(),
        axis.title.x = element_text(size = 16, face = "bold"),
        axis.title.y = element_text(size = 16, face = "bold")) +
  labs(y = "", x = "")

ggsave("minikraken-0-species.tiff", height = 8, width = 8)

# Extract data for cs == "two"
two_data <- subset(data, cs == "two")
merged0.2_data <- merge(no_data, two_data, by = c("species", "sample"), suffixes = c("_no", "_two"))

# Plot scatter plot minikraken-0.2-species
ggplot(merged0.2_data, aes(x = abundance_no, y = abundance_two)) +
  geom_point(colour = "black", size = 4) +
  geom_abline(slope = 1, intercept = 0, color = "red", linetype = "dashed", linewidth = 1) +
  theme_classic() +
  theme(panel.border = element_rect(fill = NA, linewidth = 0.5, linetype = "solid"),
        plot.background = element_blank(),
        axis.text.x = element_text(size = 16, face = "bold", colour = "black"), 
        axis.text.y = element_text(size = 16, face = "bold", colour = "black"),  
        legend.title = element_blank(),
        axis.title.x = element_text(size = 16, face = "bold"),
        axis.title.y = element_text(size = 16, face = "bold")) +
  labs(y = "", x = "")

ggsave("minikraken-0.2-species.tiff", height = 8, width = 8)

# Extract data for cs == "four"
four_data <- subset(data, cs == "four")
merged0.4_data <- merge(no_data, four_data, by = c("species", "sample"), suffixes = c("_no", "_four"))

# Plot scatter plot minikraken-0.4-species
ggplot(merged0.4_data, aes(x = abundance_no, y = abundance_four)) +
  geom_point(colour = "black", size = 4) +
  geom_abline(slope = 1, intercept = 0, color = "red", linetype = "dashed", linewidth = 1) +
  theme_classic() +
  theme(panel.border = element_rect(fill = NA, linewidth = 0.5, linetype = "solid"),
        plot.background = element_blank(),
        axis.text.x = element_text(size = 16, face = "bold", colour = "black"), 
        axis.text.y = element_text(size = 16, face = "bold", colour = "black"),  
        legend.title = element_blank(),
        axis.title.x = element_text(size = 16, face = "bold"),
        axis.title.y = element_text(size = 16, face = "bold")) +
  labs(y = "", x = "")

ggsave("minikraken-0.4-species.tiff", height = 8, width = 8)

# Load necessary libraries
library(ggplot2)
library(readxl)
library(dplyr)

# Standard-16 database

data <- relevant_data_species  # Replace with the actual data variable

# Convert to percentage and log10 scale
data$abundance <- log10(data$abundance * 100 + 1)

# Extract data for different confidence scores
no_data <- subset(data, cs == "no")
one_data <- subset(data, cs == "one")

# Align data by 'species' and 'sample'
merged_data <- merge(no_data, one_data, by = c("species", "sample"), suffixes = c("_no", "_one"))

# Plot scatter plot standard16-0-species
ggplot(merged_data, aes(x = abundance_no, y = abundance_one)) +
  geom_point(colour = "black", size = 4) +
  geom_abline(slope = 1, intercept = 0, color = "red", linetype = "dashed", linewidth = 1) +
  theme_classic() +
  theme(panel.border = element_rect(fill = NA, linewidth = 0.5, linetype = "solid"),
        plot.background = element_blank(),
        axis.text.x = element_text(size = 16, face = "bold", colour = "black"), 
        axis.text.y = element_text(size = 16, face = "bold", colour = "black"),  
        legend.title = element_blank(),
        axis.title.x = element_text(size = 16, face = "bold"),
        axis.title.y = element_text(size = 16, face = "bold")) +
  labs(y = "", x = "")

ggsave("standard16-0-species.tiff", height = 8, width = 8)

# Extract data for cs == "two"
two_data <- subset(data, cs == "two")
merged0.2_data <- merge(no_data, two_data, by = c("species", "sample"), suffixes = c("_no", "_two"))

# Plot scatter plot standard16-0.2-species
ggplot(merged0.2_data, aes(x = abundance_no, y = abundance_two)) +
  geom_point(colour = "black", size = 4) +
  geom_abline(slope = 1, intercept = 0, color = "red", linetype = "dashed", linewidth = 1) +
  theme_classic() +
  theme(panel.border = element_rect(fill = NA, linewidth = 0.5, linetype = "solid"),
        plot.background = element_blank(),
        axis.text.x = element_text(size = 16, face = "bold", colour = "black"), 
        axis.text.y = element_text(size = 16, face = "bold", colour = "black"),  
        legend.title = element_blank(),
        axis.title.x = element_text(size = 16, face = "bold"),
        axis.title.y = element_text(size = 16, face = "bold")) +
  labs(y = "", x = "")

ggsave("standard16-0.2-species.tiff", height = 8, width = 8)

# Extract data for cs == "four"
four_data <- subset(data, cs == "four")
merged0.4_data <- merge(no_data, four_data, by = c("species", "sample"), suffixes = c("_no", "_four"))

# Plot scatter plot standard16-0.4-species
ggplot(merged0.4_data, aes(x = abundance_no, y = abundance_four)) +
  geom_point(colour = "black", size = 4) +
  geom_abline(slope = 1, intercept = 0, color = "red", linetype = "dashed", linewidth = 1) +
  theme_classic() +
  theme(panel.border = element_rect(fill = NA, linewidth = 0.5, linetype = "solid"),
        plot.background = element_blank(),
        axis.text.x = element_text(size = 16, face = "bold", colour = "black"), 
        axis.text.y = element_text(size = 16, face = "bold", colour = "black"),  
        legend.title = element_blank(),
        axis.title.x = element_text(size = 16, face = "bold"),
        axis.title.y = element_text(size = 16, face = "bold")) +
  labs(y = "", x = "")

ggsave("standard16-0.4-species.tiff", height = 8, width = 8)


# Load necessary libraries
library(ggplot2)
library(readxl)
library(dplyr)

# Standard database

data <- relevant_data_species  # Replace with the actual data variable

# Convert to percentage and log10 scale
data$abundance <- log10(data$abundance * 100 + 1)

# Extract data for different confidence scores
no_data <- subset(data, cs == "no")
one_data <- subset(data, cs == "one")

# Align data by 'species' and 'sample'
merged_data <- merge(no_data, one_data, by = c("species", "sample"), suffixes = c("_no", "_one"))

# Plot scatter plot standard-0-species
ggplot(merged_data, aes(x = abundance_no, y = abundance_one)) +
  geom_point(colour = "black", size = 4) +
  geom_abline(slope = 1, intercept = 0, color = "red", linetype = "dashed", linewidth = 1) +
  theme_classic() +
  theme(panel.border = element_rect(fill = NA, linewidth = 0.5, linetype = "solid"),
        plot.background = element_blank(),
        axis.text.x = element_text(size = 16, face = "bold", colour = "black"), 
        axis.text.y = element_text(size = 16, face = "bold", colour = "black"),  
        legend.title = element_blank(),
        axis.title.x = element_text(size = 16, face = "bold"),
        axis.title.y = element_text(size = 16, face = "bold")) +
  labs(y = "", x = "")

ggsave("standard-0-species.tiff", height = 8, width = 8)

# Extract data for cs == "two"
two_data <- subset(data, cs == "two")
merged0.2_data <- merge(no_data, two_data, by = c("species", "sample"), suffixes = c("_no", "_two"))

# Plot scatter plot standard-0.2-species
ggplot(merged0.2_data, aes(x = abundance_no, y = abundance_two)) +
  geom_point(colour = "black", size = 4) +
  geom_abline(slope = 1, intercept = 0, color = "red", linetype = "dashed", linewidth = 1) +
  theme_classic() +
  theme(panel.border = element_rect(fill = NA, linewidth = 0.5, linetype = "solid"),
        plot.background = element_blank(),
        axis.text.x = element_text(size = 16, face = "bold", colour = "black"), 
        axis.text.y = element_text(size = 16, face = "bold", colour = "black"),  
        legend.title = element_blank(),
        axis.title.x = element_text(size = 16, face = "bold"),
        axis.title.y = element_text(size = 16, face = "bold")) +
  labs(y = "", x = "")

ggsave("standard-0.2-species.tiff", height = 8, width = 8)

# Extract data for cs == "four"
four_data <- subset(data, cs == "four")
merged0.4_data <- merge(no_data, four_data, by = c("species", "sample"), suffixes = c("_no", "_four"))

# Plot scatter plot standard-0.4-species
ggplot(merged0.4_data, aes(x = abundance_no, y = abundance_four)) +
  geom_point(colour = "black", size = 4) +
  geom_abline(slope = 1, intercept = 0, color = "red", linetype = "dashed", linewidth = 1) +
  theme_classic() +
  theme(panel.border = element_rect(fill = NA, linewidth = 0.5, linetype = "solid"),
        plot.background = element_blank(),
        axis.text.x = element_text(size = 16, face = "bold", colour = "black"), 
        axis.text.y = element_text(size = 16, face = "bold", colour = "black"),  
        legend.title = element_blank(),
        axis.title.x = element_text(size = 16, face = "bold"),
        axis.title.y = element_text(size = 16, face = "bold")) +
  labs(y = "", x = "")

ggsave("standard-0.4-species.tiff", height = 8, width = 8)

# Extract data for cs == "six"
six_data <- subset(data, cs == "six")
merged0.6_data <- merge(no_data, six_data, by = c("species", "sample"), suffixes = c("_no", "_six"))

# Plot scatter plot standard-0.6-species
ggplot(merged0.6_data, aes(x = abundance_no, y = abundance_six)) +
  geom_point(colour = "black", size = 4) +
  geom_abline(slope = 1, intercept = 0, color = "red", linetype = "dashed", linewidth = 1) +
  theme_classic() +
  theme(panel.border = element_rect(fill = NA, linewidth = 0.5, linetype = "solid"),
        plot.background = element_blank(),
        axis.text.x = element_text(size = 16, face = "bold", colour = "black"), 
        axis.text.y = element_text(size = 16, face = "bold", colour = "black"),  
        legend.title = element_blank(),
        axis.title.x = element_text(size = 16, face = "bold"),
        axis.title.y = element_text(size = 16, face = "bold")) +
  labs(y = "", x = "")

ggsave("standard-0.6-species.tiff", height = 8, width = 8)

# Extract data for cs == "eight"
eight_data <- subset(data, cs == "eight")
merged0.8_data <- merge(no_data, eight_data, by = c("species", "sample"), suffixes = c("_no", "_eight"))

# Plot scatter plot standard-0.8-species
ggplot(merged0.8_data, aes(x = abundance_no, y = abundance_eight)) +
  geom_point(colour = "black", size = 4) +
  geom_abline(slope = 1, intercept = 0, color = "red", linetype = "dashed", linewidth = 1) +
  theme_classic() +
  theme(panel.border = element_rect(fill = NA, linewidth = 0.5, linetype = "solid"),
        plot.background = element_blank(),
        axis.text.x = element_text(size = 16, face = "bold", colour = "black"), 
        axis.text.y = element_text(size = 16, face = "bold", colour = "black"),  
        legend.title = element_blank(),
        axis.title.x = element_text(size = 16, face = "bold"),
        axis.title.y = element_text(size = 16, face = "bold")) +
  labs(y = "", x = "")

ggsave("standard-0.8-species.tiff", height = 8, width = 8)

# Extract data for cs == "ten"
ten_data <- subset(data, cs == "ten")
merged1.0_data <- merge(no_data, ten_data, by = c("species", "sample"), suffixes = c("_no", "_ten"))

# Plot scatter plot standard-1.0-species
ggplot(merged1.0_data, aes(x = abundance_no, y = abundance_ten)) +
  geom_point(colour = "black", size = 4) +
  geom_abline(slope = 1, intercept = 0, color = "red", linetype = "dashed", linewidth = 1) +
  theme_classic() +
  theme(panel.border = element_rect(fill = NA, linewidth = 0.5, linetype = "solid"),
        plot.background = element_blank(),
        axis.text.x = element_text(size = 16, face = "bold", colour = "black"), 
        axis.text.y = element_text(size = 16, face = "bold", colour = "black"),  
        legend.title = element_blank(),
        axis.title.x = element_text(size = 16, face = "bold"),
        axis.title.y = element_text(size = 16, face = "bold")) +
  labs(y = "", x = "")

ggsave("standard-1.0-species.tiff", height = 8, width = 8)


# Load necessary libraries
library(ggplot2)
library(readxl)
library(dplyr)

# NT database

data <- relevant_data_species  # Replace with the actual data variable

# Convert to percentage and log10 scale
data$abundance <- log10(data$abundance * 100 + 1)

# Extract data for different confidence scores
no_data <- subset(data, cs == "no")
one_data <- subset(data, cs == "one")

# Align data by 'species' and 'sample'
merged_data <- merge(no_data, one_data, by = c("species", "sample"), suffixes = c("_no", "_one"))

# Plot scatter plot nt-0-species
ggplot(merged_data, aes(x = abundance_no, y = abundance_one)) +
  geom_point(colour = "black", size = 4) +
  geom_abline(slope = 1, intercept = 0, color = "red", linetype = "dashed", linewidth = 1) +
  theme_classic() +
  theme(panel.border = element_rect(fill = NA, linewidth = 0.5, linetype = "solid"),
        plot.background = element_blank(),
        axis.text.x = element_text(size = 16, face = "bold", colour = "black"), 
        axis.text.y = element_text(size = 16, face = "bold", colour = "black"),  
        legend.title = element_blank(),
        axis.title.x = element_text(size = 16, face = "bold"),
        axis.title.y = element_text(size = 16, face = "bold")) +
  labs(y = "", x = "")

ggsave("nt-0-species.tiff", height = 8, width = 8)

# Extract data for cs == "two"
two_data <- subset(data, cs == "two")
merged0.2_data <- merge(no_data, two_data, by = c("species", "sample"), suffixes = c("_no", "_two"))

# Plot scatter plot nt-0.2-species
ggplot(merged0.2_data, aes(x = abundance_no, y = abundance_two)) +
  geom_point(colour = "black", size = 4) +
  geom_abline(slope = 1, intercept = 0, color = "red", linetype = "dashed", linewidth = 1) +
  theme_classic() +
  theme(panel.border = element_rect(fill = NA, linewidth = 0.5, linetype = "solid"),
        plot.background = element_blank(),
        axis.text.x = element_text(size = 16, face = "bold", colour = "black"), 
        axis.text.y = element_text(size = 16, face = "bold", colour = "black"),  
        legend.title = element_blank(),
        axis.title.x = element_text(size = 16, face = "bold"),
        axis.title.y = element_text(size = 16, face = "bold")) +
  labs(y = "", x = "")

ggsave("nt-0.2-species.tiff", height = 8, width = 8)

# Extract data for cs == "four"
four_data <- subset(data, cs == "four")
merged0.4_data <- merge(no_data, four_data, by = c("species", "sample"), suffixes = c("_no", "_four"))

# Plot scatter plot nt-0.4-species
ggplot(merged0.4_data, aes(x = abundance_no, y = abundance_four)) +
  geom_point(colour = "black", size = 4) +
  geom_abline(slope = 1, intercept = 0, color = "red", linetype = "dashed", linewidth = 1) +
  theme_classic() +
  theme(panel.border = element_rect(fill = NA, linewidth = 0.5, linetype = "solid"),
        plot.background = element_blank(),
        axis.text.x = element_text(size = 16, face = "bold", colour = "black"), 
        axis.text.y = element_text(size = 16, face = "bold", colour = "black"),  
        legend.title = element_blank(),
        axis.title.x = element_text(size = 16, face = "bold"),
        axis.title.y = element_text(size = 16, face = "bold")) +
  labs(y = "", x = "")

ggsave("nt-0.4-species.tiff", height = 8, width = 8)

# Extract data for cs == "six"
six_data <- subset(data, cs == "six")
merged0.6_data <- merge(no_data, six_data, by = c("species", "sample"), suffixes = c("_no", "_six"))

# Plot scatter plot nt-0.6-species
ggplot(merged0.6_data, aes(x = abundance_no, y = abundance_six)) +
  geom_point(colour = "black", size = 4) +
  geom_abline(slope = 1, intercept = 0, color = "red", linetype = "dashed", linewidth = 1) +
  theme_classic() +
  theme(panel.border = element_rect(fill = NA, linewidth = 0.5, linetype = "solid"),
        plot.background = element_blank(),
        axis.text.x = element_text(size = 16, face = "bold", colour = "black"), 
        axis.text.y = element_text(size = 16, face = "bold", colour = "black"),  
        legend.title = element_blank(),
        axis.title.x = element_text(size = 16, face = "bold"),
        axis.title.y = element_text(size = 16, face = "bold")) +
  labs(y = "", x = "")

ggsave("nt-0.6-species.tiff", height = 8, width = 8)

# Extract data for cs == "eight"
eight_data <- subset(data, cs == "eight")
merged0.8_data <- merge(no_data, eight_data, by = c("species", "sample"), suffixes = c("_no", "_eight"))

# Plot scatter plot nt-0.8-species
ggplot(merged0.8_data, aes(x = abundance_no, y = abundance_eight)) +
  geom_point(colour = "black", size = 4) +
  geom_abline(slope = 1, intercept = 0, color = "red", linetype = "dashed", linewidth = 1) +
  theme_classic() +
  theme(panel.border = element_rect(fill = NA, linewidth = 0.5, linetype = "solid"),
        plot.background = element_blank(),
        axis.text.x = element_text(size = 16, face = "bold", colour = "black"), 
        axis.text.y = element_text(size = 16, face = "bold", colour = "black"),  
        legend.title = element_blank(),
        axis.title.x = element_text(size = 16, face = "bold"),
        axis.title.y = element_text(size = 16, face = "bold")) +
  labs(y = "", x = "")

ggsave("nt-0.8-species.tiff", height = 8, width = 8)

# Extract data for cs == "ten"
ten_data <- subset(data, cs == "ten")
merged1.0_data <- merge(no_data, ten_data, by = c("species", "sample"), suffixes = c("_no", "_ten"))

# Plot scatter plot nt-1.0-species
ggplot(merged1.0_data, aes(x = abundance_no, y = abundance_ten)) +
  geom_point(colour = "black", size = 4) +
  geom_abline(slope = 1, intercept = 0, color = "red", linetype = "dashed", linewidth = 1) +
  theme_classic() +
  theme(panel.border = element_rect(fill = NA, linewidth = 0.5, linetype = "solid"),
        plot.background = element_blank(),
        axis.text.x = element_text(size = 16, face = "bold", colour = "black"), 
        axis.text.y = element_text(size = 16, face = "bold", colour = "black"),  
        legend.title = element_blank(),
        axis.title.x = element_text(size = 16, face = "bold"),
        axis.title.y = element_text(size = 16, face = "bold")) +
  labs(y = "", x = "")

ggsave("nt-1.0-species.tiff", height = 8, width = 8)


# Load necessary libraries
library(ggplot2)
library(readxl)
library(dplyr)

# GTDB database

data <- relevant_data_species  # Replace with the actual data variable

# Convert to percentage and log10 scale
data$abundance <- log10(data$abundance * 100 + 1)

# Extract data for different confidence scores
no_data <- subset(data, cs == "no")
one_data <- subset(data, cs == "one")

# Align data by 'species' and 'sample'
merged_data <- merge(no_data, one_data, by = c("species", "sample"), suffixes = c("_no", "_one"))

# Plot scatter plot GTDB-0-species
ggplot(merged_data, aes(x = abundance_no, y = abundance_one)) +
  geom_point(colour = "black", size = 4) +
  geom_abline(slope = 1, intercept = 0, color = "red", linetype = "dashed", linewidth = 1) +
  theme_classic() +
  theme(panel.border = element_rect(fill = NA, linewidth = 0.5, linetype = "solid"),
        plot.background = element_blank(),
        axis.text.x = element_text(size = 16, face = "bold", colour = "black"), 
        axis.text.y = element_text(size = 16, face = "bold", colour = "black"),  
        legend.title = element_blank(),
        axis.title.x = element_text(size = 16, face = "bold"),
        axis.title.y = element_text(size = 16, face = "bold")) +
  labs(y = "", x = "")

ggsave("GTDB-0-species.tiff", height = 8, width = 8)

# Extract data for cs == "two"
two_data <- subset(data, cs == "two")
merged0.2_data <- merge(no_data, two_data, by = c("species", "sample"), suffixes = c("_no", "_two"))

# Plot scatter plot GTDB-0.2-species
ggplot(merged0.2_data, aes(x = abundance_no, y = abundance_two)) +
  geom_point(colour = "black", size = 4) +
  geom_abline(slope = 1, intercept = 0, color = "red", linetype = "dashed", linewidth = 1) +
  theme_classic() +
  theme(panel.border = element_rect(fill = NA, linewidth = 0.5, linetype = "solid"),
        plot.background = element_blank(),
        axis.text.x = element_text(size = 16, face = "bold", colour = "black"), 
        axis.text.y = element_text(size = 16, face = "bold", colour = "black"),  
        legend.title = element_blank(),
        axis.title.x = element_text(size = 16, face = "bold"),
        axis.title.y = element_text(size = 16, face = "bold")) +
  labs(y = "", x = "")

ggsave("GTDB-0.2-species.tiff", height = 8, width = 8)

# Extract data for cs == "four"
four_data <- subset(data, cs == "four")
merged0.4_data <- merge(no_data, four_data, by = c("species", "sample"), suffixes = c("_no", "_four"))

# Plot scatter plot GTDB-0.4-species
ggplot(merged0.4_data, aes(x = abundance_no, y = abundance_four)) +
  geom_point(colour = "black", size = 4) +
  geom_abline(slope = 1, intercept = 0, color = "red", linetype = "dashed", linewidth = 1) +
  theme_classic() +
  theme(panel.border = element_rect(fill = NA, linewidth = 0.5, linetype = "solid"),
        plot.background = element_blank(),
        axis.text.x = element_text(size = 16, face = "bold", colour = "black"), 
        axis.text.y = element_text(size = 16, face = "bold", colour = "black"),  
        legend.title = element_blank(),
        axis.title.x = element_text(size = 16, face = "bold"),
        axis.title.y = element_text(size = 16, face = "bold")) +
  labs(y = "", x = "")

ggsave("GTDB-0.4-species.tiff", height = 8, width = 8)

# Extract data for cs == "six"
six_data <- subset(data, cs == "six")
merged0.6_data <- merge(no_data, six_data, by = c("species", "sample"), suffixes = c("_no", "_six"))

# Plot scatter plot GTDB-0.6-species
ggplot(merged0.6_data, aes(x = abundance_no, y = abundance_six)) +
  geom_point(colour = "black", size = 4) +
  geom_abline(slope = 1, intercept = 0, color = "red", linetype = "dashed", linewidth = 1) +
  theme_classic() +
  theme(panel.border = element_rect(fill = NA, linewidth = 0.5, linetype = "solid"),
        plot.background = element_blank(),
        axis.text.x = element_text(size = 16, face = "bold", colour = "black"), 
        axis.text.y = element_text(size = 16, face = "bold", colour = "black"),  
        legend.title = element_blank(),
        axis.title.x = element_text(size = 16, face = "bold"),
        axis.title.y = element_text(size = 16, face = "bold")) +
  labs(y = "", x = "")

ggsave("GTDB-0.6-species.tiff", height = 8, width = 8)

# Extract data for cs == "eight"
eight_data <- subset(data, cs == "eight")
merged0.8_data <- merge(no_data, eight_data, by = c("species", "sample"), suffixes = c("_no", "_eight"))

# Plot scatter plot GTDB-0.8-species
ggplot(merged0.8_data, aes(x = abundance_no, y = abundance_eight)) +
  geom_point(colour = "black", size = 4) +
  geom_abline(slope = 1, intercept = 0, color = "red", linetype = "dashed", linewidth = 1) +
  theme_classic() +
  theme(panel.border = element_rect(fill = NA, linewidth = 0.5, linetype = "solid"),
        plot.background = element_blank(),
        axis.text.x = element_text(size = 16, face = "bold", colour = "black"), 
        axis.text.y = element_text(size = 16, face = "bold", colour = "black"),  
        legend.title = element_blank(),
        axis.title.x = element_text(size = 16, face = "bold"),
        axis.title.y = element_text(size = 16, face = "bold")) +
  labs(y = "", x = "")

ggsave("GTDB-0.8-species.tiff", height = 8, width = 8)

# Extract data for cs == "ten"
ten_data <- subset(data, cs == "ten")
merged1.0_data <- merge(no_data, ten_data, by = c("species", "sample"), suffixes = c("_no", "_ten"))

# Plot scatter plot GTDB-1.0-species
ggplot(merged1.0_data, aes(x = abundance_no, y = abundance_ten)) +
  geom_point(colour = "black", size = 4) +
  geom_abline(slope = 1, intercept = 0, color = "red", linetype = "dashed", linewidth = 1) +
  theme_classic() +
  theme(panel.border = element_rect(fill = NA, linewidth = 0.5, linetype = "solid"),
        plot.background = element_blank(),
        axis.text.x = element_text(size = 16, face = "bold", colour = "black"), 
        axis.text.y = element_text(size = 16, face = "bold", colour = "black"),  
        legend.title = element_blank(),
        axis.title.x = element_text(size = 16, face = "bold"),
        axis.title.y = element_text(size = 16, face = "bold")) +
  labs(y = "", x = "")

ggsave("GTDB-1.0-species.tiff", height = 8, width = 8)




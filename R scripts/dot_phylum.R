# Load required libraries
library(ggplot2)
library(readxl)
library(dplyr)

# For each database, follow these steps:

# Minikraken Database
data <- relevant_data_phylum  # Replace with actual data variable

# Convert abundance to percentage and log10 scale
data$abundance <- log10(data$abundance * 100 + 1)

# Extract data for different confidence scores
no_data <- subset(data, cs == "no")
one_data <- subset(data, cs == "one")

# Align data by 'Phylum' and 'sample'
merged_data <- merge(no_data, one_data, by = c("Phylum", "sample"), suffixes = c("_no", "_one"))

# Plot scatter plot for minikraken-0-phylum
ggplot(merged_data, aes(x = abundance_no, y = abundance_one)) +
  geom_point(colour = "black", size = 4) +
  geom_abline(slope = 1, intercept = 0, color = "red", linetype = "dashed", linewidth=1) +  # Add Y=X red dashed line
  theme_classic() +
  theme(panel.border = element_rect(fill=NA, linewidth = 0.5, linetype = "solid"),
        plot.background = element_blank(),  # Set background to blank
        axis.text.x = element_text(size = 16, face = "bold", colour = "black"), 
        axis.text.y = element_text(size = 16, face = "bold", colour = "black"),  
        legend.title = element_blank(),  # Remove legend title
        axis.title.x = element_text(size = 16, face = "bold"),  # Customize X-axis title
        axis.title.y = element_text(size = 16, face = "bold")) +  # Customize Y-axis title
  labs(y = "", x = "")

ggsave("minikraken-0-phylum.tiff", height = 8, width = 8)

# Repeat for other confidence scores
two_data <- subset(data, cs == "two")
merged0.2_data <- merge(no_data, two_data, by = c("Phylum", "sample"), suffixes = c("_no", "_two"))
ggplot(merged0.2_data, aes(x = abundance_no, y = abundance_two)) +
  geom_point(colour = "black", size = 4) +
  geom_abline(slope = 1, intercept = 0, color = "red", linetype = "dashed", linewidth=1) +  # Add Y=X red dashed line
  theme_classic() +
  theme(panel.border = element_rect(fill=NA, linewidth = 0.5, linetype = "solid"),
        plot.background = element_blank(),  # Set background to blank
        axis.text.x = element_text(size = 16, face = "bold", colour = "black"), 
        axis.text.y = element_text(size = 16, face = "bold", colour = "black"),  
        legend.title = element_blank(),  # Remove legend title
        axis.title.x = element_text(size = 16, face = "bold"),  # Customize X-axis title
        axis.title.y = element_text(size = 16, face = "bold")) +  # Customize Y-axis title
  labs(y = "", x = "")

ggsave("minikraken-0.2-phylum.tiff", height = 8, width = 8)

# Repeat the process for cs == "four"
four_data <- subset(data, cs == "four")
merged0.4_data <- merge(no_data, four_data, by = c("Phylum", "sample"), suffixes = c("_no", "_four"))
ggplot(merged0.4_data, aes(x = abundance_no, y = abundance_four)) +
  geom_point(colour = "black", size = 4) +
  geom_abline(slope = 1, intercept = 0, color = "red", linetype = "dashed", linewidth=1) +  # Add Y=X red dashed line
  theme_classic() +
  theme(panel.border = element_rect(fill=NA, linewidth = 0.5, linetype = "solid"),
        plot.background = element_blank(),  # Set background to blank
        axis.text.x = element_text(size = 16, face = "bold", colour = "black"), 
        axis.text.y = element_text(size = 16, face = "bold", colour = "black"),  
        legend.title = element_blank(),  # Remove legend title
        axis.title.x = element_text(size = 16, face = "bold"),  # Customize X-axis title
        axis.title.y = element_text(size = 16, face = "bold")) +  # Customize Y-axis title
  labs(y = "", x = "")

ggsave("minikraken-0.4-phylum.tiff", height = 8, width = 8)

# Repeat the process for other databases (standard-16, standard, nt, GTDB) in the same manner.
# Be sure to update the file names and any other specific details for each database as needed.

# Save plots for standard-16
# Repeat similar steps for 'standard', 'nt', and 'GTDB' databases.

# Standard-16 Database
data <- relevant_data_phylum  # Replace with actual data variable

# Convert abundance to percentage and log10 scale
data$abundance <- log10(data$abundance * 100 + 1)

# Extract data for different confidence scores
no_data <- subset(data, cs == "no")
one_data <- subset(data, cs == "one")

# Align data by 'Phylum' and 'sample'
merged_data <- merge(no_data, one_data, by = c("Phylum", "sample"), suffixes = c("_no", "_one"))

# Plot scatter plot for standard16-0-phylum
ggplot(merged_data, aes(x = abundance_no, y = abundance_one)) +
  geom_point(colour = "black", size = 4) +
  geom_abline(slope = 1, intercept = 0, color = "red", linetype = "dashed", linewidth=1) +  # Add Y=X red dashed line
  theme_classic() +
  theme(panel.border = element_rect(fill=NA, linewidth = 0.5, linetype = "solid"),
        plot.background = element_blank(),  # Set background to blank
        axis.text.x = element_text(size = 16, face = "bold", colour = "black"), 
        axis.text.y = element_text(size = 16, face = "bold", colour = "black"),  
        legend.title = element_blank(),  # Remove legend title
        axis.title.x = element_text(size = 16, face = "bold"),  # Customize X-axis title
        axis.title.y = element_text(size = 16, face = "bold")) +  # Customize Y-axis title
  labs(y = "", x = "")

ggsave("standard16-0-phylum.tiff", height = 8, width = 8)

# Continue this process for other confidence scores and other databases

# Save plots for standard, nt, and GTDB databases following the same procedure.

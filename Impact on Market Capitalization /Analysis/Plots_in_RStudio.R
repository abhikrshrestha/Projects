#Figure 3: Market Sensitivity: AMD vs AOSL
library(ggplot2)

# Create the data
data <- data.frame(
  Period = rep(c("Pre-COVID", "During COVID", "Post-COVID"), 2),
  Beta = c(1.97, 1.18, 1.97, 0.74, 1.28, 2.32),
  Company = c(rep("AMD", 3), rep("AOSL", 3))
)

# Set the correct order for the Period factor
data$Period <- factor(data$Period, levels = c("Pre-COVID", "During COVID", "Post-COVID"))

# Plot the graph
ggplot(data, aes(x = Period, y = Beta, group = Company, color = Company)) +
  geom_line(size = 0.5) +
  geom_point(size = 3) +
  scale_color_manual(values = c("AMD" = "orange", "AOSL" = "deeppink")) +
  ggtitle("Market Sensitivity:AMD vs AOSL") +
  ylab("Beta Value") +
  xlab("Time Period") +
  theme_minimal() +
  theme(
    plot.title = element_text(hjust = 0.5, face = "bold", size = 12),
    axis.title.x = element_text(size = 12),
    axis.title.y = element_text(size = 12)
  )

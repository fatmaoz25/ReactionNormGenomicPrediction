# Load necessary packages
library(dplyr)
library(ggplot2)

# Read CSV files
df1 <- read.csv("G:/Fatma/Env Index Manuscript/Redo_RegressionMean/All.Pred.Ability.additive.Formatted.csv")
df2 <- read.csv("G:/Fatma/Env Index Manuscript/Redo_RegressionMean/All.Pred.Ability.reactionnorm.Formatted.csv")
df2$Tester <- toupper(df2$Tester)

merged_df <- df1 %>%
  inner_join(df2, by = c("Tester", "CV"), suffix = c("_model1", "_model2"))

n <-12

results <- merged_df %>%
  group_by(Tester, CV) %>%
  summarize(
    # Calculate t-statistic manually
    t_stat = (mean_model1 - mean_model2) / sqrt((sd_model1^2 / n) + (sd_model2^2 / n)),
    
    # Compute degrees of freedom for Welch's t-test
    df = ((sd_model1^2 / n) + (sd_model2^2 / n))^2 / 
      (((sd_model1^2 / n)^2 / (n - 1)) + ((sd_model2^2 / n)^2 / (n - 1))),
    
    # Compute p-value
    p_value = 2 * pt(-abs(t_stat), df)
  ) %>%
  ungroup()

results <- results %>%
  mutate(
    significance = case_when(
      p_value < 0.001 ~ "***",
      p_value < 0.01  ~ "**",
      p_value < 0.05  ~ "*",
      TRUE            ~ ""
    )
  )

merged_df <- merged_df %>%
  left_join(results, by = c("Tester", "CV"))

library(ggplot2)

p <- ggplot(merged_df, aes(x = CV, y = mean_model1, fill = "Additive Model")) +
  geom_bar(stat = "identity", position = position_dodge(), alpha = 0.7) +
  geom_bar(aes(y = mean_model2, fill = "Regression on Mean Model"), stat = "identity", position = position_dodge(), alpha = 0.7) +
  geom_errorbar(aes(ymin = mean_model1 - sd_model1, ymax = mean_model1 + sd_model1), width = 0.2, position = position_dodge(.9)) +
  geom_errorbar(aes(ymin = mean_model2 - sd_model2, ymax = mean_model2 + sd_model2), width = 0.2, position = position_dodge(.9)) +
  
  # Add significance labels above the highest bar
  geom_text(aes(y = pmax(mean_model1, mean_model2) + 0.02, label = significance), 
            position = position_dodge(.9), size = 5, vjust = 0) +
  
  facet_wrap(~ Tester) + 
  labs(y = "Mean Correlation", x = "CV", fill = "Model") +
  theme_minimal()

p
jpeg("G:/Fatma/Env Index Manuscript/Redo_RegressionMean/Model.comparisons.jpeg", width = 5,height =7,units = "in", res=500)
p
dev.off()

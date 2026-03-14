# 1. Бібліотеки
if (!require("tidyverse")) install.packages("tidyverse")
library(tidyverse)

# 2. Повні дані (2018-2024) - тепер кількість значень всюди однакова (7 років)
lufthansa_data <- data.frame(
  Year = c(2018, 2019, 2020, 2021, 2022, 2023, 2024),
  Revenue = c(16083, 16273, 4280, 5164, 12827, 15634, 15812),
  Net_Income = c(339, 595, -780, -2310, -2664, 6765, 372),
  Fuel_Costs = c(3272, 3672, 959, 1153, 3792, 3963, 3834),
  Op_Costs = c(14790, 15133, 5071, 8089, 13704, 9310, 16864)
)

# 3. Розрахунок аналітики
dol_analysis <- lufthansa_data %>%
  mutate(
    Rev_Change_Pct = (Revenue - lag(Revenue)) / lag(Revenue),
    Cost_Change_Pct = (Op_Costs - lag(Op_Costs)) / lag(Op_Costs)
  )

# 4. Створення графіку
plot1 <- ggplot(lufthansa_data, aes(x = Year)) +
  geom_col(aes(y = Revenue, fill = "Виручка"), alpha = 0.7) +
  geom_line(aes(y = Op_Costs, color = "Операційні витрати"), linewidth = 1.5, group = 1) +
  scale_fill_manual(values = c("Виручка" = "#00205b")) +
  scale_color_manual(values = c("Операційні витрати" = "#e84e1b")) +
  theme_minimal() +
  labs(
    title = "Lufthansa: Прірва між Виручкою та Витратами (2018-2024)",
    subtitle = "Аналіз операційної стійкості під час криз",
    y = "Млн EUR",
    x = "Рік",
    fill = "", color = ""
  )

# 5. Виведення та збереження
print(plot1)
print(dol_analysis)

# Збереження картинки (переконайся, що шлях правильний)
ggsave("Завдання1/plots/lufthansa_main_analysis.png", 
       plot = plot1, width = 10, height = 6, dpi = 300)
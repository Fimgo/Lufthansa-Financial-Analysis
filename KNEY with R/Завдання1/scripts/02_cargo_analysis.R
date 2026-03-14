# 1. Бібліотеки
if (!require("tidyverse")) install.packages("tidyverse")
library(tidyverse)

# 2. Дані Cargo (2018-2024)
cargo_data <- data.frame(
  Year = c(2018, 2019, 2020, 2021, 2022, 2023, 2024),
  Cargo_Profit = c(-45, -90, 508, 1008, 1071, 105, 80) 
)

# 3. Створення графіку
plot2 <- ggplot(cargo_data, aes(x = Year, y = Cargo_Profit)) +
  geom_col(fill = "#e84e1b") + # Фірмовий помаранчевий колір
  theme_minimal() +
  labs(
    title = "Lufthansa Cargo: Рятувальний прибуток (2018-2024)",
    subtitle = "Від збитків до мільярдних доходів під час пандемії",
    y = "Чистий прибуток Cargo (млн EUR)", 
    x = "Рік"
  )

# 4. Виведення та збереження
print(plot2)

# Збереження картинки
ggsave("Завдання1/plots/cargo_profit.png", 
       plot = plot2, width = 8, height = 5, dpi = 300)
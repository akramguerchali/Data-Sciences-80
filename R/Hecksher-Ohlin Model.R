# Load the ggplot2 library
library(ggplot2)
# Define factor endowments for labor and capital in the USA and India
usa_labor <- 100
usa_capital <- 200
india_labor <- 300
india_capital <- 150

# Production coefficients for Wheat and Software Services in each country
usa_wheat_coeff <- 1
usa_software_coeff <- 2
india_wheat_coeff <- 3
india_software_coeff <- 1

# Calculate autarky production levels (no trade)
usa_wheat_autarky <- usa_labor / usa_wheat_coeff
usa_software_autarky <- usa_capital / usa_software_coeff
india_wheat_autarky <- india_labor / india_wheat_coeff
india_software_autarky <- india_capital / india_software_coeff

# World prices of Wheat and Software Services in autarky
world_price_wheat <- 1
world_price_software <- 1

# Calculate opportunity costs
usa_opportunity_cost_wheat <- world_price_software / world_price_wheat
india_opportunity_cost_software <- world_price_wheat / world_price_software
# Create a data frame for trade lines
trade_lines <- data.frame(
  CountryGood = c("USA-Wheat", "India-Software"),
  X = c(usa_wheat_autarky, india_wheat_autarky),
  Y = c(usa_software_autarky, india_software_autarky),
  Slope = c(usa_opportunity_cost_wheat, india_opportunity_cost_software)
)
# Create a data frame for trade lines
trade_lines <- data.frame(
  CountryGood = c("USA-Wheat", "India-Software"),
  X = c(usa_wheat_autarky, india_wheat_autarky),
  Y = c(usa_software_autarky, india_software_autarky),
  Slope = c(usa_opportunity_cost_wheat, india_opportunity_cost_software)
)

# Create a scatterplot with trade lines
ggplot(trade_lines, aes(x = X, y = Y, label = CountryGood)) +
  geom_point() +
  geom_text(aes(x = X + 5, y = Y - 5), size = 3) +
  geom_abline(intercept = 0, slope = trade_lines$Slope, linetype = "dashed") +
  labs(x = "Wheat Production", y = "Software Services Production") +
  theme_minimal() +
  ggtitle("Heckscher-Ohlin Model: Trade Visualization (USA/India)")

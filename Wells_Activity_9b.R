#Jason Wells
#10/18/2019
#Activity 9b
#Group: Isaiah Vaughn
library(tidyverse)
library(reshape2)
library(RColorBrewer)
ff <- french_fries
colorpal <- palette(brewer.pal(n=5,name = "Dark2"))
ff_long <- ff %>%
  gather("Category", "Amount", potato:painty) %>%
  group_by(Category) %>%
  na.omit() %>%
  summarize(avgval = mean(Amount))
ff_long %>%
  ggplot() +
  geom_col(mapping = aes(x = reorder(Category, avgval), y = avgval, fill = Category)) +
  labs(title = "French Fries",
       x = "",
       y = "Average Rating") +
  theme(plot.title = element_text(hjust = .5),
        legend.position = "none") +
  coord_flip() +
  scale_fill_manual(values = colorpal)

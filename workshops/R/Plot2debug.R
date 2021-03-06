# Simple barchart and Dotplot

# Create Karl Schedule data
# Library dplyr for data management
library(dplyr)

# Library ggplot2 for plotting
library(ggplot2)

# Creating data

do=c("Research", "Eat", "Commute", "Teach","Sleep")
hour=as.numeric(c("11","2","2","3","6"))
karlschedule=data.frame(do,hour)

# Simple procedures to convert do to factor, sort the data by hour
kschedule=karlschedule %>% 
  arrange(hour) %>% 
  mutate(do = factor(do, levels = .$do))

# Save the chart to 300 dpi
ggsave(filename = "bchartres300.png", ggplot(kschedule, aes(do, hour)) +
         geom_bar(stat = "identity") +
         coord_flip() +
         theme_bw() +
         theme(plot.title = element_text(size=22,hjust = 0.5)) +
         labs(title="Karl's schedule", 
              subtitle="",
              caption="",
              y="Number of hours",
              x ="What does Karl do?"),
       width = 5, height = 4, dpi = 300, units = "in", device='png')

ggsave(filename = "dotplotres300.png", ggplot(kschedule, aes(hour, do)) + geom_point()+
         theme(plot.title = element_text(size=22,hjust = 0.5)) +
         theme_bw() +
         labs(title="Karl's schedule", 
              subtitle="",
              caption="",
              y="Number of hours",
              x ="What does Karl do?"),
       width = 5, height = 4, dpi = 300, units = "in", device='png')
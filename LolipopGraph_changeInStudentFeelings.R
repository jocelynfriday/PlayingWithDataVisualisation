# The following code was developed to illustrate the changes in students' feelings and comfort levels with statistics before and after their first lecture on the Introduction to Statistics course. 
## Code adapted from Data-to-Vis (https://r-graph-gallery.com/303-lollipop-plot-with-2-values.html)

library(tidyverse)

statsData<- data.frame(labels= c("I am comfortable with statistics", "I am scared of statistics", "I am new to statistics"), 
                       t1 = c(2.1, 3.8, 3.0), 
                       t2 = c(3.2, 2.9, 3.1))

statsData$labels <- factor(statsData$labels, 
                           levels = c("I am comfortable with statistics", "I am scared of statistics", "I am new to statistics"), 
                           labels = c("I am comfortable with statistics", "I am scared of statistics", "I am new to statistics")
                           )

(p <- ggplot2::ggplot(statsData) + 
    geom_segment(aes(x = labels, xend = labels, y = t1, yend = t2), color = "grey", data = statsData) + 
    geom_point(aes(x = labels, y = t1, color = "Before lecture"),  size = 4) + 
    geom_point(aes(x = labels, y = t2, color = "After lecture"),  size = 4) + 
    coord_flip() + 
    theme_classic() + 
    theme(legend.position = "bottom", 
          panel.border = element_blank(),
          axis.text.x = element_text(angle = 40, vjust = 1, hjust = 1)) + 
    scale_color_manual(values = c("#951272", "#011451"), 
                       guide = guide_legend())+
    guides(color = guide_legend(reverse = TRUE, 
                                title = "Time point")) + 
    scale_y_continuous(limits = c(1, 5), 
                       breaks = c(1, 2, 3, 4, 5),
                       label = c("Strongly disagree", "Disagree", "Neutral", "Agree", "Strongly agree")
                       ) + 
    xlab("") + 
    ylab("Likert Scale"))

# Save plot
svg("ChangeInStudentOpinions.svg")
print(p)
dev.off()

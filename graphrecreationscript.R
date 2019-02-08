library(ggplot2)
water = read.csv("waterstats.csv")


#tapplymean = function(x,y){
 # tapply(x,y,mean)
#}

#lapply(water[3:7], tapplymean, water$status)

#lapply(list, function, arguments for function)
#tapply(variable of interest, grouping, mean)






meanval = tapply(water$avgdailypercent, water$status, FUN= mean)
sdval = tapply(water$avgdailypercent, water$status, FUN= sd)
status = c("EL","EV","LL","LV")

values = data.frame( status = c("EL","EV","LL","LV"), meanval, sdval)

plot1 = ggplot(values, aes(x= status, y = meanval, fill = status))+
  geom_bar(stat="identity", color = "black")+
  geom_errorbar(aes(ymax = meanval + sdval , ymin = meanval - sdval), width = 0.3)+
  scale_fill_manual(values=c("#FF3333","#339900","#33CCFF","#CC66FF"))+
  theme(legend.position="none", plot.margin = margin(1,1,1,1, "pt"),
        axis.text.x= element_text(size = 12),axis.text.y= element_text(size = 12),
        axis.line = element_line(color = "black", size = 0.5),
        axis.ticks.length = unit(0.3,"cm"),
        panel.background = element_rect(fill="white"))+
  labs(x = "Reproductive Status", y = "Percent Body Weight Lost Daily")+
  scale_y_continuous(breaks = seq(0,6,1))
plot1


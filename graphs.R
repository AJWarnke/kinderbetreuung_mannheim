library(lubridate)
library(RColorBrewer)
#
source("function_plot.R")
#
data = read.table("data.txt", sep = "\t", header = TRUE)
data$date = as.POSIXct(data$date, "%d.%m.%Y", tz = "Europe/Berlin")
#
lindenhof = data[which(data$place == "Lindenhof"), ]
mannheim = data[which(data$place == "Mannheim"), ]
#
plot_voe(filename = "Versorgungsquote_Krippe", 
         title = "Versorgungsquote Krippen Mannheim (U3)", 
         subtitle = "Quelle: Stadt Mannheim",
         ts1 = lindenhof$Krippe.VQ,
         ts2 = mannheim$Krippe.VQ,
         title_ts1 = "Lindenhof",
         title_ts2 = "Mannheim",
         source = "Eigene Darstellung; Quelle: Dezernat III, Stadt Mannheim"
)

plot_voe(filename = "Versorgungsquote_Kindergarten", 
         title = "Versorgungsquote Kindergarten Mannheim (Ü3)", 
         subtitle = "Quelle: Stadt Mannheim",
         ts2 = lindenhof$Kindergarten.VQ,
         ts1 = mannheim$Kindergarten.VQ,
         title_ts2 = "Lindenhof",
         title_ts1 = "Mannheim",
         source = "Eigene Darstellung; Quelle: Dezernat III, Stadt Mannheim"
)
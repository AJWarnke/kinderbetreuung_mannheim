###
#
# Plot VÖ Quote
#
###

plot_voe = function(filename, title, subtitle, ts1, ts2, title_ts1, title_ts2, source) {
  png(paste0(title, ".png"), width = 800, height = 400, units = "px")
    plot(mannheim$date, rep(NA, nrow(mannheim)), ylim = c(0, 100), xaxt = "n", yaxt = "n", xlab = "", ylab = "")
    mtext(title, line = 2.5, cex = 1.5)
    mtext(subtitle, line = .85, cex = 1.15)
    mtext("Versorgungsquote", side = 2, line = 2)
    axis(1, year(mannheim[which(month(mannheim$date) == 7), "date"]), at = mannheim[which(month(mannheim$date) == 7), "date"], las = 1, cex = 2)
    axis(2, paste0(seq(0, 100, 20), "%"), at = seq(0, 100, 20), las = 2)
    abline(v = mannheim$date, col = "gray", lty = 3)
    abline(v = mannheim[which(month(mannheim$date) == 1), "date"], col = "darkred", lty = 2, lwd = 1)
    abline(h = seq(0, 100, 20), col = "gray", lty = 3)
    # Graphs
    lines(mannheim$date, ts1, type = "b", pch = 16, lwd = 3, col = brewer.pal(3, "Set1")[3])
    lines(mannheim$date, ts2, type = "b", pch = 16, lwd = 3, col = brewer.pal(3, "Set1")[1])
    legend("bottom", c(title_ts1, title_ts2), pch = 16, col = brewer.pal(3, "Set1")[c(3,1)], cex = 1.25)
    #
    mtext(source, side = 1, adj = 1, line = -1, outer = TRUE)
  dev.off()
}


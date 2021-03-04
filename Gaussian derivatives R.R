# Author: Yang kaili
# Date: 2021-3-4
# Gaussian distribution PDF, along with its first and second derivatives 

pdf <- function(){
  x0 <- seq(-5, 5, by = 0.1)
  y0 <- dnorm(x0, 0, 1)
  y1 <- -(x0)*dnorm(x0, 0, 1)
  y2 <- (x0^2)*dnorm(x0, 0, 1) - dnorm(x0, 0, 1)
  curve(x0, y0, y1, y2)
}

curve <- function(x0, y0, y1, y2){
  png(file = "PDF_R.jpg")
  
  plot(x0, y0, type = "o", lty = 1, col = "red", pch = 19, 
       ylim = c(-0.4, 0.4), xlab = "value", ylab = "density", 
       main = "Standard pdf and its the derivative, second derivative")
  lines(x0, y1, type = "o", lty = 1, col = "green", pch = 19)
  lines(x0, y2, type = "o", lty = 1, col = "blue", pch = 19)
  legend("topright", c("f(x)", "f'(x)", "f''(x)"), 
         text.col = c("red", "green", "blue"), bty = "n")
  
  dev.off()
}

pdf()


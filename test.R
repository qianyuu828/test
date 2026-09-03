# QQY 的彩色螺旋星云
# 只使用 R 自带功能，不需要安装额外的软件包。

set.seed(828)

stars <- 18000
angle <- seq(0, 30 * pi, length.out = stars)
radius <- seq(0.02, 1, length.out = stars)

# 加入少量随机扰动，让规则的螺旋看起来更像星云。
x <- radius * cos(angle) + rnorm(stars, sd = 0.018)
y <- radius * sin(angle) + rnorm(stars, sd = 0.018)

star_colours <- hsv(
  h = (angle / (2 * pi)) %% 1,
  s = 0.75,
  v = 1,
  alpha = 0.65
)

output_file <- "qqy_spiral.png"
png(output_file, width = 1200, height = 1200, res = 150, bg = "#050510")

par(mar = rep(0, 4), bg = "#050510")
plot(
  x, y,
  type = "n",
  asp = 1,
  axes = FALSE,
  xlab = "",
  ylab = "",
  xlim = c(-1.08, 1.08),
  ylim = c(-1.08, 1.08)
)

points(x, y, pch = 16, cex = runif(stars, 0.08, 0.45), col = star_colours)
text(0, 0, "QQY", col = "white", cex = 3.2, font = 2)
text(0, -0.10, "is working", col = "#9DEBFF", cex = 1.1)

dev.off()

cat("✨ qqy is working!\n")
cat("🌌 彩色螺旋星云已生成：", normalizePath(output_file), "\n")

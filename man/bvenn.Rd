\name{bvenn}
\alias{bvenn}
\title{Simple alternative to Venn diagrams}
\usage{
  bvenn(sets, percentage = FALSE, colors = NULL,
    fontsize = 15, main = "", scale = 1, add = FALSE)
}
\arguments{
  \item{sets}{list of vectors to overlap. If list contains
  more than 3 elements only the first 3 are used.}

  \item{percentage}{logical showing if percentages or raw
  numbers are displayed}

  \item{colors}{vector of colors for the bubbles, see
  details on specifying that}

  \item{fontsize}{fontsize used for the numbers in the
  bubbles}

  \item{main}{title of the plot}

  \item{scale}{a scaling factor to adjust the base triangle
  size when the plot does not fit the window well.}

  \item{add}{logical determining if the figure is added to
  exixting plot or if a new plot is initialized}
}
\description{
  A simple alternative to the traditional Venn diagram. It
  depicts each overlap as a separate bubble with area
  proportional to the overlap size.
}
\details{
  Colors can be specified as vector. For 2 set case a 3
  element vector is required with colors for: Set1, Set2
  and Set1 & Set2 correspondingly. For 3 set case a 7
  element vector is required with colors for: Set1, Set2,
  Set3, Set1 & Set2, Set1 & Set3, Set2 & Set3 and Set1 &
  Set2 & Set3 correspondingly.
}
\examples{
bvenn(list(Set1 = sample(letters, 14), Set2 = sample(letters, 9)))
bvenn(list(Set1 = sample(letters, 16), Set2 = sample(letters, 12), Set3 = sample(letters, 7)))

# Adding colors
bvenn(list(Set1 = sample(letters, 14), Set2 = sample(letters, 9)), colors = c("red",
"green", "yellow"))
bvenn(list(Set1 = sample(letters, 16), Set2 = sample(letters, 12), Set3 =
sample(letters, 7)), colors = c("red", "blue", "yellow", "purple", "orange", "green",
"brown"))

# Adjust the triangle size
bvenn(list(Set1 = sample(letters, 16), Set2 = sample(letters, 12), Set3 =
sample(letters, 7)), colors = c("red", "blue", "yellow", "purple", "orange", "green",
"brown"), scale = 0.7)


# Combine several diagrams using grid graphics
vplayout = function(x, y){
	return(viewport(layout.pos.row = x, layout.pos.col = y))
}
grid.newpage()
pushViewport(viewport(layout = grid.layout(ncol = 2, nrow = 2)))
for(i in 1:2){
	for(j in 1:2){
		pushViewport(vplayout(i, j))
		bvenn(list(Set1 = sample(letters, 16), Set2 = sample(letters, 3+ 3*j), Set3 = sample(letters, 7)), add = TRUE, fontsize = 10)
		upViewport()
	}
}
}
\author{
  Raivo Kolde <rkolde@gmail.com>
}


## Readme
Here, two images of MRI scans of the brain are used. One image is of a healthy brain(healthy.csv), and the other image
is of a brain with <a href = "http://en.wikipedia.org/wiki/Oligodendroglioma">Oligodendroglioma</a>, a tumor that occurs commonly
in the front lobe of the brain(tumor.csv). Brain biopsy is the only definite diagonsis of this tumor, and hence, MRI guidance is key to
determining its location and geometry.

K-Means clustering is used to classify the healthy image data into 5 different clusters. These clusters are then used to 
train the tumor image data. The tumor image is then plotted with the newly predicted clusters. As we can see, it clearly shows
the location of the tumor.

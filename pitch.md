Data Products: Shiny App and Pitch Assignment
========================================================
author: Eric Henderson
date: June 21st, 2017
autosize: true
transition: rotate

App Overview
========================================================

The app is designed to display some simple plots (scatter and box) for the Edgar Anderson's Iris Data supplied in the R datasets package.

The user can select which variables of the data are used.

Additionaly, the app can display a regression line and show the computed intercept, slope, and P Value.

Details about the data set can be found at: https://en.wikipedia.org/wiki/Iris_flower_data_set

Scatter Plot and Regression
========================================================
Users select a Y Value and X Value, along with factors, which are then displayed in a scatter plot (Points are colored by factor).

A regression line appears in the plot if the user selected the feature. In the side bar calculated values for intercept, slope, and P Value appear.
***
![plot of chunk unnamed-chunk-1](pitch-figure/unnamed-chunk-1-1.png)

More Details for the Y Value (Box Plot)
========================================================
The user selected Y Value is also displayed, vs Species, in a box plot. Like the scatter plot, only selected factors are present in the plot.

Points are displayed over the box plots, in a jittered fashion, and colored by factor.
***
![plot of chunk unnamed-chunk-2](pitch-figure/unnamed-chunk-2-1.png)

Project Details
========================================================

The app was made using Shiny and hosted on shinyapps.io. The app can be found at https://eric-henderson-127.shinyapps.io/dataproductsfinalassignment/

This presentation was made using Rstudio Presenter. This presentation can be found at https://Eric-Henderson-127.github.io/ShinyAppAndPitch/pitch.html

The source files for both the app and this presentation can be found at https://github.com/Eric-Henderson-127/ShinyAppAndPitch

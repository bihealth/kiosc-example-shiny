## Start with the shiny docker image from the rocker project
## https://www.rocker-project.org/
FROM rocker/shiny:latest

## install necessary R libraries
RUN R -e "install.packages(c('ggplot2'))"

## expose the port on which shiny runs
EXPOSE 8080

#copy the current folder into the path of the app
COPY . /usr/local/src/app

#set working directory to the app
WORKDIR /usr/local/src/app

## the app_run.R wrapper contains the R command to run the app
## The actual app is defined in app.R
CMD ["/usr/local/bin/Rscript", "app_run.R" ]

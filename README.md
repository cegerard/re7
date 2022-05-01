# README

![test](https://github.com/cegerard/re7/actions/workflows/tests.yml/badge.svg)
![deploy](https://github.com/cegerard/re7/actions/workflows/deploy.yml/badge.svg)


This application is deploy on Heroku and is currently available [here](https://re7finder.herokuapp.com/)

## CI

There is a simple CI based on Github actions. Tests are run on each MR and are mandatory to merge on the main branch.

When there is an MR merge on the main branch, two worwflows are run. The first one test the main branch and the second deploy to Heroku.
The deploy job push the source code to Heroku, then it is deploy into production dyno. Migration are run from a Procfile release task. 

## Database

For local and test envrionnement we are using sqlite. In production the database used is Postgres.

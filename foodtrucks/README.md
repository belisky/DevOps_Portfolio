## Abstract

This is a 3 tier application deployed using Docker

- Presentation layer - Nginx
- Application layer - Flask
- Database layer- Elasticsearch(ES)

### SF Food Trucks

===

> San Francisco's finger-licking street food now at your fingertips.

![img](shot.png)

This is a fun application built by Prakhar Srivastav to accompany the docker curriculum. The app is built with [Flask](http://flask.pocoo.org/) on the backend and [Elasticsearch](http://elastic.co/) is the search engine powering the searches. The front-end is built with [React](http://facebook.github.io/react/) and the beautiful maps are courtesy of [Mapbox](https://www.mapbox.com/).

If you find the design of the website a bit ostentatious, blame [Genius](http://genius.com) for giving me the idea of using this color scheme. Lastly, the data for the food trucks is made available in public domain by [SF Data](https://data.sfgov.org/Economy-and-Community/Mobile-Food-Facility-Permit/rqzj-sfat).

#### Application Architecture

The application is comprised of two services:

(1) A Python Server which serves both data and a JS based UI

(2) An ElasticSearch Server which hosts the data and allows searching

#### Configuration

The ElasticSearch connection details are hard-coded into app.py
The Flask Server runs on port 5000

#### Building & Running the app

In order to build the app you will need:

(1) Python

(2) Pip

(3) NodeJS & NPM

### Steps:

(1) npm install

(2) npm run build

(3) pip install -r requirements.txt

After building you can start the app by running `python ./app.py`

### Steps to Run

- clone this repo
- cd into foodtrucks and run
- docker compose up --build -d

### One Step At a time.

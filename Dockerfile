FROM node:latest as frontend
WORKDIR /app
COPY ./react-frontend .

RUN yarn install
RUN yarn build

# Use the official lightweight Python image.
# https://hub.docker.com/_/python
FROM python:3.7-slim

# Install production dependencies.
RUN pip install Flask flask-cors gunicorn

# Copy local code to the container image.
WORKDIR /app
COPY ./flask-backend .
COPY --from=frontend /app/build/ /app/build/

# Run the web service on container startup. Here we use the gunicorn
# webserver, with one worker process and 8 threads.
# For environments with multiple CPU cores, increase the number of workers
# to be equal to the cores available.
CMD exec gunicorn --bind :$PORT --workers 1 --threads 8 app:app


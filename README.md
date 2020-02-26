# Cloud Run Template (React+Flask)

## Setup

Install the `node_modules`.

```
cd react
yarn install
```

# Dev

1. Start the app.

```
cd react
yarn start
```

2. Open a new Terminal and run a Flask server.

```
cd flask
python app.py
```

3. The app can now be viewed on `localhost:3000`.

## Deploy (locally)

1. Build the app.

```
cd react
yarn build
```

2. Run a Flask server.

```
cd ../flask
python3 app.py
```

3. The app can now be viewed on `localhost:8080`.

## Deploy (Cloud Run)

1. Build container image using Cloud Build.

```
gcloud builds submit --tag gcr.io/<project-id>/<container-name>
```

2. Deploy using Cloud Run.

```
gcloud run deploy --image gcr.io/<project-id>/<container-name> --platform managed
```

## Secrets

We're currently working on properly handling tokens.

For now, please place your Mapbox token directly in the `.js` file
and make sure that you only allow usage via certain URLs.

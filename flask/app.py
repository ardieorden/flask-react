import os
from flask import Flask, send_from_directory, send_file
from flask_cors import CORS

app = Flask(__name__)
CORS(app)


@app.route("/<filename>")
def send_build(filename):
    return send_from_directory("build", filename)


@app.route("/static/css/<filename>")
def send_css(filename):
    return send_from_directory("build/static/css", filename)


@app.route("/static/js/<filename>")
def send_js(filename):
    return send_from_directory("build/static/js", filename)


@app.route("/static/media/<filename>")
def send_media(filename):
    return send_from_directory("build/static/media", filename)


@app.route("/")
def index():
    return send_file("build/index.html")


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8080, debug=True)

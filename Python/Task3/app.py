import json
import os
import sqlite3
from datetime import datetime, timedelta
import calendar
from meteostat import Point, Daily
import platform
from flask import Flask, redirect, request, url_for
from flask_login import (
    LoginManager,
    current_user,
    login_required,
    login_user,
    logout_user,
)

from oauthlib.oauth2 import WebApplicationClient
import requests

from db import init_db_command
from user import User

GOOGLE_CLIENT_ID = os.environ.get("GOOGLE_CLIENT_ID", None)
GOOGLE_CLIENT_SECRET = os.environ.get("GOOGLE_CLIENT_SECRET", None)
GOOGLE_DISCOVERY_URL = ("https://accounts.google.com/.well-known/openid-configuration")
api_key = "3aa7276aaecb56c4f1fae8dffc411134"
app = Flask(__name__)
app.secret_key = os.environ.get("SECRET_KEY") or os.urandom(24)

login_manager = LoginManager()
login_manager.init_app(app)

try:
    init_db_command()
except sqlite3.OperationalError: 
    pass # Assume it's already been created

client = WebApplicationClient(GOOGLE_CLIENT_ID)

def not_auth():
    if current_user.is_authenticated:
        return False
    else:
        return True

@login_manager.user_loader
def load_user(user_id):
    return User.get(user_id)

@app.route("/index")
def index():
        if not_auth():
            return '<a class="button" href="/login">Google Login</a>' 
        return (
            '<div> <form action="/list">'
            '<p>Enter a city</p>'
            '<input type="text" id="city" name="city" value=''>'
            '<input type="submit" value="See weather forecast">'
            '</form> </div>'
            '<div display:flex> <form action="/select">'
            '<p>Enter a city</p>'
            '<input type="text" id="city" name="city" value=''>'
            '<input type="date" id="date" name="date" value=''>'
            '<input type="submit" value="See weather archive">'
            '</form> </div>'
            '<a class="button" href="/about">About you</a><br>'
            '<a class="button" href="/useragent">About your computer</a><br>'
            '<a class="button" href="/logout">Logout</a>'
            )

@app.route("/about")
def about():
    if not_auth():
        return '<a class="button" href="/login">Google Login</a>'
    return (
            "<p>Your name is {}</p>"
            "<p>Your email is {}</p>"
            "<div><p>Google Profile Picture:</p>"
            '<img src="{}" alt="Google profile pic"></img></div>'
            '<a class="button" href="/index">Back</a>'.format(
                current_user.name, current_user.email, current_user.profile_pic
            )
    )

@app.route("/list")
def list():
    if not_auth():
            return '<a class="button" href="/login">Google Login</a>'
    back='<a class="button" href="/index">Back</a>'
    city=request.args.get('city')
    if city=='':
        return (f'Please enter a city<br>{back}')
    request_url = "/list/"+city
    return redirect(request_url)

@app.route("/select")
def select():
    if not_auth():
            return '<a class="button" href="/login">Google Login</a>'
    back='<a class="button" href="/index">Back</a>'
    city=request.args.get('city')
    date=request.args.get('date')
    if city=='':
        return (f'Please enter a city<br>{back}'
                )
    if date=='':
        return (f'Please enter a date<br>{back}'
                )
    request_url = "/"+city+"/"+date
    return redirect(request_url)


def get_data(city):
    url = f'https://api.openweathermap.org/data/2.5/weather?q={city}&appid={api_key}'
    req = requests.get(url)
    return req.json()

@app.route("/list/<city>")
def list_city(city):
    if not_auth():
            return '<a class="button" href="/login">Google Login</a>'
    back='<a class="button" href="/index">Back</a>'
    data = get_data(city)
    if data['cod']=='404':
        return f'{data.message}<br>{back}'
    name = data['name']
    lon = data['coord']['lon']
    lat = data['coord']['lat']

    exclude = "hourly,minutely"
    url = f'https://api.openweathermap.org/data/2.5/onecall?lat={lat}&lon={lon}&exclude={exclude}&appid={api_key}'
    req = requests.get(url)
    data = req.json()

    days = []
    nights = []
    descr = []
    for i in data['daily']:
            days.append(int(i['temp']['day'] - 273.15))
            nights.append(int(i['temp']['night'] - 273.15))
            descr.append(i['weather'][0]['main'])
    string = f'[ {name} weather forecast]<br>'
    date=datetime.now()
    for i in range(len(days)):       
        if i == 0:
            string += f'<br>Today<br>'
        elif i == 1:
            string += f'<br>Tomorrow<br>'   
        else:
            string += f'<br>{calendar.day_name[date.weekday()]}<br>' 
        date+=timedelta(days=1) 
        string += 'Day temperature: ' + str(days[i]) + '°C' + "<br>"
        string += 'Night temperature: ' + str(nights[i]) + '°C' + "<br>"
        string += 'Conditions:' + descr[i] + '<br>'
        
    return string+back

@app.route("/<city>/<date>")
def weather_past(city,date):
    if not_auth():
            return '<a class="button" href="/login">Google Login</a>'
    back='<a class="button" href="/index">Back</a>'
    data = get_data(city)
    if data['cod']=='404':
        return f'{data.message}<br>{back}'
    name = data['name']
    lon = data['coord']['lon']
    lat = data['coord']['lat']

    date=date.split('-')
    if int(date[0])<1970 or int(date[0])>2022:
        return f'Enter a valid year<br>{back}' 
    start = datetime(int(date[0]), int(date[1]), int(date[2]))
    if start>datetime.now():
        return f'Enter a date before today<br>{back}'
    location = Point(lat, lon)

    data = Daily(location, start, start)
    data = data.fetch()
    string = f'[ {name} weather archive]<br>'

    string+=f'Average temperature: {data.tavg[0]}<br>'
    
    string+=f'Precipitation: {data.prcp[0]}<br>'   
    return string+back

@app.route("/useragent")
def useragent():
    if not_auth():
            return '<a class="button" href="/login">Google Login</a>'
    string=f'Your os: {request.user_agent.platform}<br>'
    string+=f'Your browser: {request.user_agent.browser}<br>'
    string+='<a class="button" href="/index">Back</a>'
    return string;    
              

def get_google_provider_cfg():
    return requests.get(GOOGLE_DISCOVERY_URL).json()

@app.route("/login")
def login():
    google_provider_cfg = get_google_provider_cfg()
    authorization_endpoint = google_provider_cfg["authorization_endpoint"]

    request_uri = client.prepare_request_uri(
        authorization_endpoint,
        redirect_uri=request.base_url + "/callback",
        scope=["openid", "email", "profile"],
    )
    return redirect(request_uri)


@app.route("/login/callback")
def callback():
    code = request.args.get("code")

    google_provider_cfg = get_google_provider_cfg()
    token_endpoint = google_provider_cfg["token_endpoint"]

    token_url, headers, body = client.prepare_token_request(
        token_endpoint,
        authorization_response=request.url,
        redirect_url=request.base_url,
        code=code,
    )

    token_response = requests.post(
        token_url,
        headers=headers,
        data=body,
        auth=(GOOGLE_CLIENT_ID, GOOGLE_CLIENT_SECRET),
    )

    client.parse_request_body_response(json.dumps(token_response.json()))

    userinfo_endpoint = google_provider_cfg["userinfo_endpoint"]
    uri, headers, body = client.add_token(userinfo_endpoint)
    userinfo_response = requests.get(uri, headers=headers, data=body)

    if userinfo_response.json().get("email_verified"):
        unique_id = userinfo_response.json()["sub"]
        users_email = userinfo_response.json()["email"]
        picture = userinfo_response.json()["picture"]
        users_name = userinfo_response.json()["given_name"]
    else:
        return "User email not available or not verified by Google.", 400

    user = User(
        id_=unique_id, name=users_name, email=users_email, profile_pic=picture
    )

    if not User.get(unique_id):
        User.create(unique_id, users_name, users_email, picture)

    login_user(user)

    return redirect(url_for("index"))

@app.route("/logout")
@login_required
def logout():
    logout_user()
    return redirect(url_for("index"))

if __name__ == "__main__":
    app.run(ssl_context="adhoc", debug=True)
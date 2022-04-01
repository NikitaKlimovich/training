from datetime import datetime, timedelta
import calendar
from meteostat import Point, Daily
from flask import Flask, redirect, request


import requests


api_key = "3aa7276aaecb56c4f1fae8dffc411134"
app = Flask(__name__)
#app.secret_key = os.environ.get("SECRET_KEY") or os.urandom(24)


@app.route("/")
def go():
    return redirect('/index')


@app.route("/index")
def index():
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
            '<a class="button" href="/useragent">About your computer</a><br>'
            )



@app.route("/list")
def list():
    back='<a class="button" href="/index">Back</a>'
    city=request.args.get('city')
    if city=='':
        return (f'Please enter a city<br>{back}')
    request_url = "/list/"+city
    return redirect(request_url)

@app.route("/select")
def select():
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
    string=f'Your os: {request.user_agent.platform}<br>'
    string+=f'Your browser: {request.user_agent.browser}<br>'
    string+='<a class="button" href="/index">Back</a>'
    return string;    
              
if __name__ == "__main__":
    app.run(host='0.0.0.0',port=5000)
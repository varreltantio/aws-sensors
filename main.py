from flask import Flask, render_template, request
from flask_socketio import SocketIO
import psycopg2
from random import random
from threading import Lock
from datetime import datetime

thread = None
thread_lock = Lock()

app = Flask(__name__)
app.config['SECRET_KEY'] = 'secret!'
socketio = SocketIO(app)

conn = psycopg2.connect(database="aws-sensors",
                        host="localhost",
                        user="postgres",
                        password="postgres",
                        port="5432")

def get_current_datetime():
    now = datetime.now()
    return now.strftime("%m/%d/%Y %H:%M:%S")


def sensor_curah_hujan():
    dummy_sensor_curah_hujan = round(random() * 100, 3)
    date = get_current_datetime()

    query = "INSERT INTO curah_hujan(value, date) VALUES(%s,%s) returning id"
    values = (dummy_sensor_curah_hujan, date,)
    cursor = conn.cursor()
    cursor.execute(query, values)
    inserted_user_id = cursor.fetchone()[0]
    conn.commit()
   
    socketio.emit('updateCurahHujan', {'id': inserted_user_id, 'value': dummy_sensor_curah_hujan, 'date': date})


def sensor_kecepatan_angin():
    dummy_sensor_kecepatan_angin = round(random() * 100, 3)
    date = get_current_datetime()

    query = "INSERT INTO kecepatan_angin(value, date) VALUES(%s,%s) returning id"
    values = (dummy_sensor_kecepatan_angin, date,)
    cursor = conn.cursor()
    cursor.execute(query, values)
    inserted_user_id = cursor.fetchone()[0]
    conn.commit()
    
    socketio.emit('updateKecepatanAngin', {'id': inserted_user_id, 'value': dummy_sensor_kecepatan_angin, 'date': date})


def sensor_arah_angin():
    dummy_sensor_arah_angin = round(random() * 100, 3)
    date = get_current_datetime()

    query = "INSERT INTO arah_angin(value, date) VALUES(%s,%s) returning id"
    values = (dummy_sensor_arah_angin, date,)
    cursor = conn.cursor()
    cursor.execute(query, values)
    inserted_user_id = cursor.fetchone()[0]
    conn.commit()
    
    socketio.emit('updateArahAngin', {'id': inserted_user_id, 'value': dummy_sensor_arah_angin, 'date': date})

def background_thread():
    while True:
        sensor_curah_hujan()
        sensor_kecepatan_angin()
        sensor_arah_angin()
        socketio.sleep(60)


@app.route('/')
def index():
    return render_template('index.html')

@socketio.on('connect')
def connect():
    global thread
    print('Client connected')

    cursor = conn.cursor()
    cursor.execute('SELECT * FROM curah_hujan')
    dataCurahHujan = cursor.fetchall()

    cursor = conn.cursor()
    cursor.execute('SELECT * FROM kecepatan_angin')
    dataKecepatanAngin = cursor.fetchall()

    cursor = conn.cursor()
    cursor.execute('SELECT * FROM arah_angin')
    dataArahAngin = cursor.fetchall()

    cursor.close()

    socketio.emit('dataCurahHujan', dataCurahHujan)
    socketio.emit('dataKecepatanAngin', dataKecepatanAngin)
    socketio.emit('dataArahAngin', dataArahAngin)

    global thread
    with thread_lock:
        if thread is None:
            thread = socketio.start_background_task(background_thread)

@socketio.on('disconnect')
def disconnect():
    print('Client disconnected',  request.sid)

if __name__ == '__main__':
    socketio.run(app, debug=True)

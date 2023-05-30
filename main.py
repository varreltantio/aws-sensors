from flask import Flask, render_template
import psycopg2

app = Flask(__name__)

conn = psycopg2.connect(database="aws-sensors",
                        host="localhost",
                        user="postgres",
                        password="postgres",
                        port="5432")


@app.route('/')
def index():
    cur = conn.cursor()
    cur.execute('SELECT * FROM curah_hujan;')
    curah_hujan = cur.fetchall()
    return render_template('index.html', curah_hujan=curah_hujan)


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5010, debug=True)

## Prerequisites
- Python 3.7 or higher installed
- PostgreSQL installed and running

## Setup

1. Clone the repository:

```
$ git clone https://github.com/varreltantio/aws-sensors.git
$ cd aws-sensors
```

2. Create a virtual environment:

```
$ python -m venv env
```

3. Activate a virtual environment:

```
$ env\scripts\activate (for windows)
$ source env/bin/activate (for linux)
```

4. Install the required dependencies:

```
$ pip install -r requirements.txt
```

5. Configure the PostgreSQL database:
   - Create a new database in PostgreSQL.
   - Import the database from `database/aws-sensors.sql`

6. Run the application:

```
$ python main.py
```

7. Open your browser and navigate to http://localhost:5000 to access the application.

## Directory Structure
- main.py: The main Flask application file.
- templates/: Directory containing HTML templates for the application views.
- static/: Directory for static files (CSS, JavaScript, etc.).
- requirements.txt: File listing the required Python packages.

## Contributing
Contributions are welcome! If you find any issues or have suggestions for improvements, please feel free to open an issue or submit a pull request.

## License
This project is licensed under the [MIT License](https://github.com/varreltantio/aws-sensors/blob/main/LICENSE).

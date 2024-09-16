from sqlalchemy import create_engine
from sqlalchemy.orm import declarative_base, scoped_session
from sqlalchemy.orm.session import sessionmaker
from pyodbc import connect

# Define the database connection URL using Windows Authentication
DATABASE_URL = "mssql+pyodbc://localhost/SQLEXPRESS:1433/Metropolis_Exploration?driver=ODBC+Driver+17+for+SQL+Server&trusted_connection=yes"

# Create the database engine
engine = create_engine(DATABASE_URL)

# Create a configured "Session" class
Session = scoped_session(sessionmaker(bind=engine))

# Create a base class for declarative class definitions
Base = declarative_base()

def get_session():
    return Session()
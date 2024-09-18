from sqlalchemy import create_engine
from sqlalchemy.orm import declarative_base, scoped_session
from sqlalchemy.orm.session import sessionmaker
from pyodbc import connect

DATABASE_URL = "mssql+pyodbc://localhost/SQLEXPRESS:1433/Metropolis_Exploration?driver=ODBC+Driver+17+for+SQL+Server&trusted_connection=yes"

engine = create_engine(DATABASE_URL)

Session = scoped_session(sessionmaker(bind=engine))

Base = declarative_base()

def get_session():
    return Session()
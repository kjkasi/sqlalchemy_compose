from sqlalchemy import create_engine
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker
from sqlalchemy_utils import database_exists, create_database


SQLALCHEMY_DATABASE_URL = "mssql+pyodbc://sa:Pass1word@host.docker.internal:5433/alchemy?driver=ODBC+Driver+17+for+SQL+Server"

engine = create_engine(
    SQLALCHEMY_DATABASE_URL
    , connect_args={"check_same_thread": False}
)

if not database_exists(engine.url):
    create_database(engine.url)
else:
    print("database_exists: True")

SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)

Base = declarative_base()
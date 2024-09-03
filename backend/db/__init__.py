# db/__init__.py

# Example content to initialize a database connection using SQLAlchemy
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker

# Replace with your actual database URL
DATABASE_URL = "postgresql://user:password@localhost/yourdatabase"

# Creating a database engine
engine = create_engine(DATABASE_URL)

# Creating a configured "Session" class
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)

# Import all models here to ensure they are registered properly with SQLAlchemy
from .models import *

# Any other database initialization code can go here

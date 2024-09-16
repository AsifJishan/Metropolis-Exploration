from database import Base
from sqlalchemy import Column, Integer, String, Float, Date, DECIMAL, ForeignKey
from sqlalchemy.orm import relationship

# Ward model
class Ward(Base):
    __tablename__ = "Ward"
    Ward_ID = Column(Integer, primary_key=True)
    Ward_Name = Column(String)
    Area = Column(Float)
    Population_Count = Column(Integer)
    Number_of_Buildings = Column(Integer)
    Number_of_Vehicles = Column(Integer)
    Average_Income = Column(Float)
    Crime_Rate = Column(Float)
    Business_Count = Column(Integer)
    Unemployment_Rate = Column(Float)

    # Relationships to link with other tables
    ward_info = relationship("Ward_info", back_populates="ward")
    people = relationship("People", back_populates="ward")
    buildings = relationship("Buildings", back_populates="ward")
    projects = relationship("InfrastructureProjects", back_populates="ward")
    businesses = relationship("Businesses", back_populates="ward")

# Ward_info model
class Ward_info(Base):
    __tablename__ = "Ward_info"
    Area_ID = Column(Integer, primary_key=True)
    Ward_ID = Column(Integer, ForeignKey("Ward.Ward_ID"))
    Area = Column(String)
    Number_of_Households = Column(Integer)
    Number_of_Schools = Column(Integer)
    Number_of_Hospitals = Column(Integer)
    Number_of_Parks = Column(Integer)
    Number_of_Public_Transportation_Stops = Column(Integer)
    Number_of_Public_Utilities = Column(Integer)
    Number_of_Government_Offices = Column(Integer)
    Number_of_Community_Centers = Column(Integer)
    Number_of_Playgrounds = Column(Integer)
    Number_of_Libraries = Column(Integer)

    # Relationships to link with other tables
    ward = relationship("Ward", back_populates="ward_info")
    projects = relationship("InfrastructureProjects", back_populates="area")
    businesses = relationship("Businesses", back_populates="area")
    env_data = relationship("EnvData", back_populates="area")

# People model
class People(Base):
    __tablename__ = "People"
    People_ID = Column(Integer, primary_key=True)
    First_Name = Column(String)
    Last_Name = Column(String)
    Date_of_Birth = Column(Date)
    Gender = Column(String)
    Occupation = Column(String)
    Profession = Column(String)
    Income = Column(Float)
    Marital_Status = Column(String)
    Number_of_Children = Column(Integer)
    Education_Level = Column(String)
    Religion = Column(String)
    Language_ = Column(String)
    National_ID = Column(String)
    Ward_ID = Column(Integer, ForeignKey("Ward.Ward_ID"))
    Area_ID = Column(Integer, ForeignKey("Ward_info.Area_ID"))

    # Relationships
    ward = relationship("Ward", back_populates="people")

# Buildings model
class Buildings(Base):
    __tablename__ = "Buildings"
    Building_ID = Column(Integer, primary_key=True)
    Building_Name = Column(String)
    Building_Type = Column(String)
    Number_of_Floors = Column(Integer)
    Total_Area = Column(Float)
    Year_Built = Column(Integer)
    Number_of_Rooms = Column(Integer)
    Number_of_Parkings = Column(Integer)
    Ward_ID = Column(Integer, ForeignKey("Ward.Ward_ID"))

    # Relationships
    ward = relationship("Ward", back_populates="buildings")

# Vehicles model
class Vehicles(Base):
    __tablename__ = "Vehicles"
    Vehicle_ID = Column(Integer, primary_key=True)
    Building_ID = Column(Integer, ForeignKey("Buildings.Building_ID"))
    Vehicle_Type = Column(String)
    Vehicle_Make = Column(String)
    Vehicle_Model = Column(String)
    Vehicle_Year = Column(Integer)
    Vehicle_Color = Column(String)
    Vehicle_Parking_Spot = Column(Integer)

# EnvData model
class EnvData(Base):
    __tablename__ = "EnvData"
    id = Column(Integer, primary_key=True)
    location = Column(String)
    temperature = Column(Float)
    humidity = Column(Float)
    pollution_level = Column(Float)
    recorded_at = Column(Date)
    Area_ID = Column(Integer, ForeignKey("Ward_info.Area_ID"))

    # Relationships
    area = relationship("Ward_info", back_populates="env_data")

# Infrastructure Projects model
class InfrastructureProjects(Base):
    __tablename__ = 'infrastructure_projects'

    project_id = Column(Integer, primary_key=True)
    project_name = Column(String(255))
    project_type = Column(String(255))
    start_date = Column(Date)
    end_date = Column(Date)
    budget = Column(DECIMAL(15, 2))
    ward_id = Column(Integer, ForeignKey('Ward.Ward_ID'))
    area_id = Column(Integer, ForeignKey('Ward_info.Area_ID'))

    # Relationships to access linked Ward and Area data
    ward = relationship("Ward", back_populates="projects")
    area = relationship("Ward_info", back_populates="projects")

# Businesses model
class Businesses(Base):
    __tablename__ = 'businesses'

    business_id = Column(Integer, primary_key=True)
    business_name = Column(String(255))
    business_type = Column(String(255))
    address = Column(String(255))
    ward_id = Column(Integer, ForeignKey('Ward.Ward_ID'))
    area_id = Column(Integer, ForeignKey('Ward_info.Area_ID'))

    # Relationships to access linked Ward and Area data
    ward = relationship("Ward", back_populates="businesses")
    area = relationship("Ward_info", back_populates="businesses")

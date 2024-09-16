from fastapi import APIRouter, HTTPException
from pydantic import BaseModel
from database import Session
from models import Ward, Ward_info, People, Buildings, Vehicles, EnvData

router = APIRouter()


# Define a Pydantic model for the API request body
class WardRequest(BaseModel):
    Ward_Name: str
    Area: float
    Population_Count: int
    Number_of_Buildings: int
    Number_of_Vehicles: int
    Average_Income: float
    Crime_Rate: float
    Business_Count: int
    Unemployment_Rate: float

# Define a Pydantic model for the API request body
class WardInfoRequest(BaseModel):
    Ward_ID: int
    Area: str
    Number_of_Households: int
    Number_of_Schools: int
    Number_of_Hospitals: int
    Number_of_Parks: int
    Number_of_Public_Transportation_Stops: int
    Number_of_Public_Utilities: int
    Number_of_Government_Offices: int
    Number_of_Community_Centers: int
    Number_of_Playgrounds: int
    Number_of_Libraries: int

# Define a Pydantic model for the API request body
class PeopleRequest(BaseModel):
    First_Name: str
    Last_Name: str
    Date_of_Birth: str
    Gender: str
    Occupation: str
    Profession: str
    Income: float
    Marital_Status: str
    Number_of_Children: int
    Education_Level: str
    Religion: str
    Language_: str
    National_ID: str
    Ward_ID: int
    Area_ID: int

# Define a Pydantic model for the API request body
class BuildingsRequest(BaseModel):
    Building_Name: str
    Building_Type: str
    Number_of_Floors: int
    Total_Area: float
    Year_Built: int
    Number_of_Rooms: int
    Number_of_Parkings: int
    Ward_ID: int

# Define a Pydantic model for the API request body
class VehiclesRequest(BaseModel):
    Building_ID: int
    Vehicle_Type: str
    Vehicle_Make: str
    Vehicle_Model: str
    Vehicle_Year: int
    Vehicle_Color: str
    Vehicle_Parking_Spot: int

# Define a Pydantic model for the API request body
class EnvDataRequest(BaseModel):
    location: str
    temperature: float
    humidity: float
    pollution_level: float
    recorded_at: str
    Area_ID: int

class InfrastructureProjectsRequest(BaseModel):
    project_name: str
    project_type: str
    start_date: date
    end_date: date
    budget: float
    ward_id: int
    area_id: int

# Request model for Businesses
class BusinessesRequest(BaseModel):
    business_name: str
    business_type: str
    address: str
    ward_id: int
    area_id: int

# Define the API route for creating a new Ward
@router.post("/wards/")
def create_ward(ward_request: WardRequest):
    session = Session()
    ward = Ward(**ward_request.dict())
    session.add(ward)
    session.commit()
    return {"message": "Ward created successfully"}

# Define the API route for creating a new Ward_info
@router.post("/ward_infos/")
def create_ward_info(ward_info_request: WardInfoRequest):
    session = Session()
    ward_info = Ward_info(**ward_info_request.dict())
    session.add(ward_info)
    session.commit()
    return {"message": "Ward_info created successfully"}

# Define the API route for creating a new People
@router.post("/people/")
def create_people(people_request: PeopleRequest):
    session = Session()
    people = People(**people_request.dict())
    session.add(people)
    session.commit()
    return {"message": "People created successfully"}

# Define the API route for creating a new Buildings
@router.post("/buildings/")
def create_buildings(buildings_request: BuildingsRequest):
    session = Session()
    buildings = Buildings(**buildings_request.dict())
    session.add(buildings)
    session.commit()
    return {"message": "Buildings created successfully"}

# Define the API route for creating a new Vehicles
@router.post("/vehicles/")
def create_vehicles(vehicles_request: VehiclesRequest):
    session = Session()
    vehicles = Vehicles(**vehicles_request.dict())
    session.add(vehicles)
    session.commit()
    return {"message": "Vehicles created successfully"}

# Define the API route for creating a new EnvData
@router.post("/env_data/")
def create_env_data(env_data_request: EnvDataRequest):
    session = Session()
    env_data = EnvData(**env_data_request.dict())
    session.add(env_data)
    session.commit()
    return {"message": "EnvData created successfully"}

# Define the API route for creating a new InfrastructureProject
@router.post("/infrastructure_projects/")
def create_infrastructure_project(infrastructure_project_request: InfrastructureProjectsRequest):
    session = Session()
    project = InfrastructureProjects(**infrastructure_project_request.dict())
    session.add(project)
    session.commit()
    return {"message": "Infrastructure project created successfully"}

# Define the API route for creating a new Business
@router.post("/businesses/")
def create_business(business_request: BusinessesRequest):
    session = Session()
    business = Businesses(**business_request.dict())
    session.add(business)
    session.commit()
    return {"message": "Business created successfully"}


# Define the API route for getting all Wards
# Define the API route for getting all Wards
@router.get("/wards/")
def get_wards():
    session = Session()
    wards = session.query(Ward).all()
    return [{"Ward_ID": ward.Ward_ID, "Ward_Name": ward.Ward_Name, "Area": ward.Area, "Population_Count": ward.Population_Count, "Number_of_Buildings": ward.Number_of_Buildings, "Number_of_Vehicles": ward.Number_of_Vehicles, "Average_Income": ward.Average_Income, "Crime_Rate": ward.Crime_Rate, "Business_Count": ward.Business_Count, "Unemployment_Rate": ward.Unemployment_Rate} for ward in wards]

# Define the API route for getting all Ward_infos
@router.get("/ward_infos/")
def get_ward_infos():
    session = Session()
    ward_infos = session.query(Ward_info).all()
    return [{"Area_ID": ward_info.Area_ID, "Ward_ID": ward_info.Ward_ID, "Area": ward_info.Area, "Number_of_Households": ward_info.Number_of_Households, "Number_of_Schools": ward_info.Number_of_Schools, "Number_of_Hospitals": ward_info.Number_of_Hospitals, "Number_of_Parks": ward_info.Number_of_Parks, "Number_of_Public_Transportation_Stops": ward_info.Number_of_Public_Transportation_Stops, "Number_of_Public_Utilities": ward_info.Number_of_Public_Utilities, "Number_of_Government_Offices": ward_info.Number_of_Government_Offices, "Number_of_Community_Centers": ward_info.Number_of_Community_Centers, "Number_of_Playgrounds": ward_info.Number_of_Playgrounds, "Number_of_Libraries": ward_info.Number_of_Libraries} for ward_info in ward_infos]

# Define the API route for getting all People
@router.get("/people/")
def get_people():
    session = Session()
    people = session.query(People).all()
    return [{"People_ID": people.People_ID, "First_Name": people.First_Name, "Last_Name": people.Last_Name, "Date_of_Birth": people.Date_of_Birth, "Gender": people.Gender, "Occupation": people.Occupation, "Profession": people.Profession, "Income": people.Income, "Marital_Status": people.Marital_Status, "Number_of_Children": people.Number_of_Children, "Education_Level": people.Education_Level, "Religion": people.Religion, "Language_": people.Language_, "National_ID": people.National_ID, "Ward_ID": people.Ward_ID, "Area_ID": people.Area_ID} for people in people]

# Define the API route for getting all Buildings
@router.get("/buildings/")
def get_buildings():
    session = Session()
    buildings = session.query(Buildings).all()
    return [{"Building_ID": building.Building_ID, "Building_Name": building.Building_Name, "Building_Type": building.Building_Type, "Number_of_Floors": building.Number_of_Floors, "Total_Area": building.Total_Area, "Year_Built": building.Year_Built, "Number_of_Rooms": building.Number_of_Rooms, "Number_of_Parkings": building.Number_of_Parkings, "Ward_ID": building.Ward_ID} for building in buildings]

# Define the API route for getting all Vehicles
@router.get("/vehicles/")
def get_vehicles():
    session = Session()
    vehicles = session.query(Vehicles).all()
    return [{"Vehicle_ID": vehicle.Vehicle_ID, "Building_ID": vehicle.Building_ID, "Vehicle_Type": vehicle.Vehicle_Type, "Vehicle_Make": vehicle.Vehicle_Make, "Vehicle_Model": vehicle.Vehicle_Model, "Vehicle_Year": vehicle.Vehicle_Year, "Vehicle_Color": vehicle.Vehicle_Color, "Vehicle_Parking_Spot": vehicle.Vehicle_Parking_Spot} for vehicle in vehicles]

# Define the API route for getting all EnvData
@router.get("/env_data/")
def get_env_data():
    session = Session()
    env_data = session.query(EnvData).all()
    return [{"id": env_data.id, "location": env_data.location, "temperature": env_data.temperature, "humidity": env_data.humidity, "pollution_level": env_data.pollution_level, "recorded_at": env_data.recorded_at, "Area_ID": env_data.Area_ID} for env_data in env_data]

# Define the API route for getting a Ward by ID
# Define the API route for getting a Ward by ID
@router.get("/wards/{ward_id}")
def get_ward(ward_id: int):
    session = Session()
    ward = session.query(Ward).filter(Ward.Ward_ID == ward_id).first()
    if ward is None:
        raise HTTPException(status_code=404, detail="Ward not found")
    return {"Ward_ID": ward.Ward_ID, "Ward_Name": ward.Ward_Name, "Area": ward.Area, "Population_Count": ward.Population_Count, "Number_of_Buildings": ward.Number_of_Buildings, "Number_of_Vehicles": ward.Number_of_Vehicles, "Average_Income": ward.Average_Income, "Crime_Rate": ward.Crime_Rate, "Business_Count": ward.Business_Count, "Unemployment_Rate": ward.Unemployment_Rate}

# Define the API route for getting a Ward_info by ID
@router.get("/ward_infos/{ward_info_id}")
def get_ward_info(ward_info_id: int):
    session = Session()
    ward_info = session.query(Ward_info).filter(Ward_info.Area_ID == ward_info_id).first()
    if ward_info is None:
        raise HTTPException(status_code=404, detail="Ward_info not found")
    return {"Area_ID": ward_info.Area_ID, "Ward_ID": ward_info.Ward_ID, "Area": ward_info.Area, "Number_of_Households": ward_info.Number_of_Households, "Number_of_Schools": ward_info.Number_of_Schools, "Number_of_Hospitals": ward_info.Number_of_Hospitals, "Number_of_Parks": ward_info.Number_of_Parks, "Number_of_Public_Transportation_Stops": ward_info.Number_of_Public_Transportation_Stops, "Number_of_Public_Utilities": ward_info.Number_of_Public_Utilities, "Number_of_Government_Offices": ward_info.Number_of_Government_Offices, "Number_of_Community_Centers": ward_info.Number_of_Community_Centers, "Number_of_Playgrounds": ward_info.Number_of_Playgrounds, "Number_of_Libraries": ward_info.Number_of_Libraries}

# Define the API route for getting a People by ID
@router.get("/people/{people_id}")
def get_people(people_id: int):
    session = Session()
    people = session.query(People).filter(People.People_ID == people_id).first()
    if people is None:
        raise HTTPException(status_code=404, detail="People not found")
    return {"People_ID": people.People_ID, "First_Name": people.First_Name, "Last_Name": people.Last_Name, "Date_of_Birth": people.Date_of_Birth, "Gender": people.Gender, "Occupation": people.Occupation, "Profession": people.Profession, "Income": people.Income, "Marital_Status": people.Marital_Status, "Number_of_Children": people.Number_of_Children, "Education_Level": people.Education_Level, "Religion": people.Religion, "Language_": people.Language_, "National_ID": people.National_ID, "Ward_ID": people.Ward_ID, "Area_ID": people.Area_ID}

# Define the API route for getting a Buildings by ID
@router.get("/buildings/{building_id}")
def get_buildings(building_id: int):
    session = Session()
    buildings = session.query(Buildings).filter(Buildings.Building_ID == building_id).first()
    if buildings is None:
        raise HTTPException(status_code=404, detail="Buildings not found")
    return {"Building_ID": buildings.Building_ID, "Building_Name": buildings.Building_Name, "Building_Type": buildings.Building_Type, "Number_of_Floors": buildings.Number_of_Floors, "Total_Area": buildings.Total_Area, "Year_Built": buildings.Year_Built, "Number_of_Rooms": buildings.Number_of_Rooms, "Number_of_Parkings": buildings.Number_of_Parkings, "Ward_ID": buildings.Ward_ID}

# Define the API route for getting a Vehicles by ID
@router.get("/vehicles/{vehicle_id}")
def get_vehicles(vehicle_id: int):
    session = Session()
    vehicles = session.query(Vehicles).filter(Vehicles.Vehicle_ID == vehicle_id).first()
    if vehicles is None:
        raise HTTPException(status_code=404, detail="Vehicles not found")
    return {"Vehicle_ID": vehicles.Vehicle_ID, "Building_ID": vehicles.Building_ID, "Vehicle_Type": vehicles.Vehicle_Type, "Vehicle_Make": vehicles.Vehicle_Make, "Vehicle_Model": vehicles.Vehicle_Model, "Vehicle_Year": vehicles.Vehicle_Year, "Vehicle_Color": vehicles.Vehicle_Color, "Vehicle_Parking_Spot": vehicles.Vehicle_Parking_Spot}

# Define the API route for getting a EnvData by ID
@router.get("/env_data/{env_data_id}")
def get_env_data(env_data_id: int):
    session = Session()
    env_data = session.query(EnvData).filter(EnvData.id == env_data_id).first()
    if env_data is None:
        raise HTTPException(status_code=404, detail="EnvData not found")
    return {"id": env_data.id, "location": env_data.location, "temperature": env_data.temperature, "humidity": env_data.humidity, "pollution_level": env_data.pollution_level, "recorded_at": env_data.recorded_at, "Area_ID": env_data.Area_ID}

# Define the API route for getting all InfrastructureProjects
@router.get("/infrastructure_projects/")
def get_infrastructure_projects():
    session = Session()
    projects = session.query(InfrastructureProjects).all()
    return [{
        "Project_ID": project.project_id,
        "Project_Name": project.project_name,
        "Project_Type": project.project_type,
        "Start_Date": project.start_date,
        "End_Date": project.end_date,
        "Budget": project.budget,
        "Ward_ID": project.ward_id,
        "Area_ID": project.area_id
    } for project in projects]

# Define the API route for getting all Businesses
@router.get("/businesses/")
def get_businesses():
    session = Session()
    businesses = session.query(Businesses).all()
    return [{
        "Business_ID": business.business_id,
        "Business_Name": business.business_name,
        "Business_Type": business.business_type,
        "Address": business.address,
        "Ward_ID": business.ward_id,
        "Area_ID": business.area_id
    } for business in businesses]

from fastapi import APIRouter, HTTPException
from pydantic import BaseModel
from database import Session
from models import Ward, Ward_info, People, Buildings, Vehicles, EnvData, InfrastructureProjects, Businesses
from datetime import date

router = APIRouter()

class WardRequest(BaseModel):
    ward_name: str
    area: float
    population_count: int
    number_of_buildings: int
    number_of_vehicles: int
    average_income: float
    crime_rate: float
    business_count: int
    unemployment_rate: float

class WardInfoRequest(BaseModel):
    ward_id: int
    area: str
    number_of_households: int
    number_of_schools: int
    number_of_hospitals: int
    number_of_parks: int
    number_of_public_transportation_stops: int
    number_of_public_utilities: int
    number_of_government_offices: int
    number_of_community_centers: int
    number_of_playgrounds: int
    number_of_libraries: int

class PeopleRequest(BaseModel):
    first_name: str
    last_name: str
    date_of_birth: date
    gender: str
    occupation: str
    profession: str
    income: float
    marital_status: str
    number_of_children: int
    education_level: str
    religion: str
    language: str
    national_id: str
    ward_id: int
    area_id: int

class BuildingsRequest(BaseModel):
    building_name: str
    building_type: str
    number_of_floors: int
    total_area: float
    year_built: int
    number_of_rooms: int
    number_of_parkings: int
    ward_id: int

class VehiclesRequest(BaseModel):
    building_id: int
    vehicle_type: str
    vehicle_make: str
    vehicle_model: str
    vehicle_year: int
    vehicle_color: str
    vehicle_parking_spot: int

class EnvDataRequest(BaseModel):
    location: str
    temperature: float
    humidity: float
    pollution_level: float
    recorded_at: date
    area_id: int

class InfrastructureProjectsRequest(BaseModel):
    project_name: str
    project_type: str
    start_date: date
    end_date: date
    budget: float
    ward_id: int
    area_id: int

class BusinessesRequest(BaseModel):
    business_name: str
    business_type: str
    address: str
    ward_id: int
    area_id: int

@router.post("/wards/")
def create_ward(ward_request: WardRequest):
    session = Session()
    ward = Ward(**ward_request.dict())
    session.add(ward)
    session.commit()
    return {"message": "Ward created successfully"}

@router.post("/ward_infos/")
def create_ward_info(ward_info_request: WardInfoRequest):
    session = Session()
    ward_info = Ward_info(**ward_info_request.dict())
    session.add(ward_info)
    session.commit()
    return {"message": "Ward info created successfully"}

@router.post("/people/")
def create_people(people_request: PeopleRequest):
    session = Session()
    people = People(**people_request.dict())
    session.add(people)
    session.commit()
    return {"message": "Person created successfully"}

@router.post("/buildings/")
def create_building(building_request: BuildingsRequest):
    session = Session()
    building = Buildings(**building_request.dict())
    session.add(building)
    session.commit()
    return {"message": "Building created successfully"}

@router.post("/vehicles/")
def create_vehicle(vehicle_request: VehiclesRequest):
    session = Session()
    vehicle = Vehicles(**vehicle_request.dict())
    session.add(vehicle)
    session.commit()
    return {"message": "Vehicle created successfully"}

@router.post("/env_data/")
def create_env_data(env_data_request: EnvDataRequest):
    session = Session()
    env_data = EnvData(**env_data_request.dict())
    session.add(env_data)
    session.commit()
    return {"message": "Environmental data created successfully"}

@router.post("/infrastructure_projects/")
def create_infrastructure_project(infrastructure_project_request: InfrastructureProjectsRequest):
    session = Session()
    project = InfrastructureProjects(**infrastructure_project_request.dict())
    session.add(project)
    session.commit()
    return {"message": "Infrastructure project created successfully"}

@router.post("/businesses/")
def create_business(business_request: BusinessesRequest):
    session = Session()
    business = Businesses(**business_request.dict())
    session.add(business)
    session.commit()
    return {"message": "Business created successfully"}

@router.get("/wards/")
def get_wards():
    session = Session()
    wards = session.query(Ward).all()
    return [ward.__dict__ for ward in wards]

@router.get("/ward_infos/")
def get_ward_infos():
    session = Session()
    ward_infos = session.query(Ward_info).all()
    return [ward_info.__dict__ for ward_info in ward_infos]

@router.get("/people/")
def get_people():
    session = Session()
    people = session.query(People).all()
    return [person.__dict__ for person in people]

@router.get("/buildings/")
def get_buildings():
    session = Session()
    buildings = session.query(Buildings).all()
    return [building.__dict__ for building in buildings]

@router.get("/vehicles/")
def get_vehicles():
    session = Session()
    vehicles = session.query(Vehicles).all()
    return [vehicle.__dict__ for vehicle in vehicles]

@router.get("/env_data/")
def get_env_data():
    session = Session()
    env_data = session.query(EnvData).all()
    return [data.__dict__ for data in env_data]

@router.get("/infrastructure_projects/")
def get_infrastructure_projects():
    session = Session()
    projects = session.query(InfrastructureProjects).all()
    return [project.__dict__ for project in projects]

@router.get("/businesses/")
def get_businesses():
    session = Session()
    businesses = session.query(Businesses).all()
    return [business.__dict__ for business in businesses]

@router.get("/wards/{ward_id}")
def get_ward(ward_id: int):
    session = Session()
    ward = session.query(Ward).filter(Ward.Ward_ID == ward_id).first()
    if ward is None:
        raise HTTPException(status_code=404, detail="Ward not found")
    return ward.__dict__

@router.get("/ward_infos/{ward_info_id}")
def get_ward_info(ward_info_id: int):
    session = Session()
    ward_info = session.query(Ward_info).filter(Ward_info.Area_ID == ward_info_id).first()
    if ward_info is None:
        raise HTTPException(status_code=404, detail="Ward info not found")
    return ward_info.__dict__

@router.get("/people/{people_id}")
def get_person(people_id: int):
    session = Session()
    person = session.query(People).filter(People.People_ID == people_id).first()
    if person is None:
        raise HTTPException(status_code=404, detail="Person not found")
    return person.__dict__

@router.get("/buildings/{building_id}")
def get_building(building_id: int):
    session = Session()
    building = session.query(Buildings).filter(Buildings.Building_ID == building_id).first()
    if building is None:
        raise HTTPException(status_code=404, detail="Building not found")
    return building.__dict__

@router.get("/vehicles/{vehicle_id}")
def get_vehicle(vehicle_id: int):
    session = Session()
    vehicle = session.query(Vehicles).filter(Vehicles.Vehicle_ID == vehicle_id).first()
    if vehicle is None:
        raise HTTPException(status_code=404, detail="Vehicle not found")
    return vehicle.__dict__

@router.get("/env_data/{env_data_id}")
def get_env_data_by_id(env_data_id: int):
    session = Session()
    env_data = session.query(EnvData).filter(EnvData.id == env_data_id).first()
    if env_data is None:
        raise HTTPException(status_code=404, detail="Environmental data not found")
    return env_data.__dict__

@router.get("/infrastructure_projects/{project_id}")
def get_infrastructure_project(project_id: int):
    session = Session()
    project = session.query(InfrastructureProjects).filter(InfrastructureProjects.project_id == project_id).first()
    if project is None:
        raise HTTPException(status_code=404, detail="Infrastructure project not found")
    return project.__dict__

@router.get("/businesses/{business_id}")
def get_business(business_id: int):
    session = Session()
    business = session.query(Businesses).filter(Businesses.business_id == business_id).first()
    if business is None:
        raise HTTPException(status_code=404, detail="Business not found")
    return business.__dict__
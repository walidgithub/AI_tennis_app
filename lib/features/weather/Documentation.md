# Feature Documentation

## Weather Features

**Location**: `/lib/features`

#### Data Layer

**Location**: `/lib/features/weather/data`
**Description**: This layer includes the remote data source (RESTful API), response's models and repository implementations.

#### Domain Layer

**Location**: `/lib/features/weather/domain`  
**Description**: This layer comprises entities, repository interfaces, requests and use cases.

#### Presentation Layer

**Location**: `/lib/features/weather/presentation`  
**Description**: This layer contains UI-related components, including:
- BLoC (Business Logic Component)
- Pages (MapView And WeatherView)
- Some related components
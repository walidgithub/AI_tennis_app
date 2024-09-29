# Project Components Documentation

## 1. Core

**Location**: `/lib/core`

**Description**: The core module contains shared functionality across the application, including:
- Dependency injection
- Network management
- User preferences
- Routing
- App styling
- Application constants
- UI components
- Error handling (using Firebase and Dio)
- Base use cases

---

## 2. Features

**Location**: `/lib/features`

### Feature: Auth

#### Data Layer

**Location**: `/lib/features/user/data`  
**Description**: This layer includes the Firebase data source and repository implementations.

#### Domain Layer

**Location**: `/lib/features/user/domain`  
**Description**: This layer comprises entities, repository interfaces, and use cases.

#### Presentation Layer

**Location**: `/lib/features/user/presentation`  
**Description**: This layer contains UI-related components, including:
- BLoC (Business Logic Component)
- Pages
- Widgets
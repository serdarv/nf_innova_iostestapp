# GitHub Repository Explorer

A modern iOS application that displays GitHub user repositories with clean architecture and SwiftUI.

## 🎯 Overview

Simple, scalable iOS app built around the GitHub API, showcasing repository listings and detailed views with proper state management and dependency injection.

## 📱 Features

- **Repository List**: Browse user repositories with open issues count
- **Repository Details**: View detailed information including owner, stats, and tags
- **Clean UI**: Modern SwiftUI interface with proper loading and error states
- **Offline Support**: Fallback to mock data when network unavailable

## 🏗️ Architecture

### Clean Architecture + MVVM
- **Views**: SwiftUI views with proper state binding
- **ViewModels**: Business logic with `@Published` properties
- **Services**: Network layer with protocol abstractions
- **Models**: Separate API models and Visual models

### Key Patterns
- **Dependency Injection**: Swinject for easy testing and mocking
- **Repository Pattern**: Clean data access layer
- **Factory Pattern**: Transform API models to UI-friendly Visual models
- **State Management**: Centralized `ViewState` enum (idle, loading, error)

## 🔌 API Endpoints

- `GET /users/octocat/repos` - User repositories
- `GET /repos/octocat/{repo}` - Repository details  
- `GET /repos/octocat/{repo}/tags` - Repository tags

## 🧪 Testing Strategy

Architecture designed for easy testing:
- Protocol-based services enable mocking
- ViewModels are testable in isolation
- DI container can inject mock dependencies

```swift
// Easy to mock for testing
private let repoService = DIManager.shared.resolve(GithubVisualServiceProtocol.self)
```

## 🛠️ Technical Stack

- **iOS**: 17.0+
- **Swift**: 6.2
- **UI**: SwiftUI
- **Concurrency**: async/await
- **DI**: Swinject
- **Architecture**: MVVM + Clean Architecture
- **Networking**: Custom protocol-based layer

## 🚀 Getting Started

1. Clone the repository
2. Open `iostestapp.xcodeproj` 
3. Build and run

## 🎨 Design Principles

- **Separation of Concerns**: Clear layer boundaries
- **Dependency Inversion**: Protocols over concrete types  
- **Single Responsibility**: Each component has one job
- **Testability**: Easy to unit test and mock
- **Maintainability**: Clean, readable, scalable code

## 🔄 State Management

Consistent state handling across the app:

```swift
enum ViewState {
    case idle
    case loading  
    case error(String?)
}
```

All screens use `BaseView` for uniform loading and error presentation.

---

*Built with modern iOS development best practices and scalable architecture patterns.*

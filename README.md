# AI Learning Route Planner

A Flutter mobile/web app that uses AI to create personalized learning roadmaps with spaced repetition flashcards, resource discovery, and an AI tutor.

## Features

- **AI Roadmap Generation** — Describe your learning goal, and Claude AI generates a structured roadmap with phases and tasks
- **Spaced Repetition Flashcards** — SM-2 algorithm optimizes review intervals for long-term retention
- **Resource Discovery** — Search the web for learning resources via Exa API and bookmark them to tasks
- **AI Tutor** — Chat with an AI tutor for explanations, examples, and learning guidance
- **Multi-language** — English and Simplified Chinese support

## Tech Stack

| Layer | Technology |
|-------|-----------|
| Framework | Flutter |
| State Management | Riverpod |
| Navigation | go_router |
| Database | Drift (SQLite) |
| AI Providers | Claude, DeepSeek, OpenAI, Grok, Gemini |
| Search | Exa API |

## Getting Started

### Prerequisites

- Flutter SDK >=3.0
- Claude API key (required)
- Exa API key (optional, for resource search)

### Installation

```bash
flutter pub get
flutter run
```

### API Keys

On first launch, you'll be prompted to enter your API keys in **Settings**:

- **Claude API Key** — Required for roadmap and flashcard generation
- **Exa API Key** — Optional, for resource search functionality

## Architecture

```
lib/
├── core/
│   ├── database/      # Drift database + generated code
│   ├── router/        # go_router navigation
│   ├── theme/         # Light/dark themes
│   └── errors/        # Error handling
├── features/
│   ├── home/          # Dashboard
│   ├── roadmap/      # Create & view roadmaps
│   ├── resources/     # Bookmark & search resources
│   ├── learning/      # Flashcard review (SM-2)
│   ├── tutor/         # AI chat tutor
│   ├── settings/      # API keys & preferences
│   └── onboarding/    # Initial setup
└── services/ai/       # AI service abstractions
```

## Database Schema

- **Roadmaps** → **Phases** → **Tasks** (hierarchical learning plan)
- **Resources** (bookmarkable links)
- **TaskResources** (task-resource associations)
- **Flashcards** with SM-2 fields (easeFactor, interval, repetitions)
- **Reviews** (review history)

## Building

```bash
flutter build web      # Web build
flutter build apk      # Android APK
flutter build ios      # iOS (requires macOS)
```

## License

MIT

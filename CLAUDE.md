# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

AI Learning Route Planner - A Flutter mobile/web app that uses AI to create personalized learning roadmaps with spaced repetition flashcards, resource discovery, and an AI tutor.

## Build & Development Commands

```bash
flutter pub get          # Install dependencies
flutter run             # Run on connected device/emulator
flutter run -d <id>     # Run on specific device
flutter build web       # Build for web
flutter test            # Run all tests
flutter test test/widget_test.dart  # Run single test file
flutter analyze         # Run static analysis
dart run build_runner build  # Regenerate drift/database code
```

## Architecture

### State Management
- **Riverpod** for all state management
- Providers defined in `lib/features/<feature>/presentation/providers/providers.dart`
- Core providers in `lib/features/roadmap/presentation/providers/providers.dart` include:
  - `databaseProvider` - Drift database instance
  - `aiServiceProvider` / `claudeServiceProvider` - AI backend clients
  - `roadmapsProvider` - Stream of all roadmaps
  - `roadmapGenerationProvider` - Roadmap creation state
  - `resourceSearchProvider` - Exa resource search state

### Navigation
- **go_router** with `ShellRoute` for bottom navigation
- Routes defined in `lib/core/router/app_router.dart`
- Auth redirect logic checks `claude_api_key` in SharedPreferences
- Bottom nav items: Home, Roadmaps, Resources, Tutor, Profile

### Database (Drift/SQLite)
Tables in `lib/core/database/app_database.dart`:
- `Roadmaps` → `Phases` → `Tasks` (hierarchical learning plan)
- `Resources` (bookmarkable learning resources)
- `TaskResources` (many-to-many linking)
- `Flashcards` with SM-2 spaced repetition fields (easeFactor, interval, repetitions)
- `Reviews` (flashcard review history)

Generated code in `app_database.g.dart`.

### AI Services (`lib/services/ai/`)
- **AIService** - Multi-provider abstraction (Claude, DeepSeek, OpenAI, Grok, Gemini)
- **ClaudeService** - Direct Claude API calls for roadmap/flashcard generation
- **ResourceSearchService** - Exa API for web resource discovery
- **SM2Algorithm** - Spaced repetition calculation

### Features (`lib/features/`)
Each feature follows a partial Clean Architecture structure:
- `roadmap/` - Create/view learning roadmaps with phases and tasks
- `resources/` - Resource library with bookmarking
- `learning/` - Flashcard review with SM-2
- `tutor/` - AI chat tutor
- `home/` - Dashboard
- `settings/` - API key configuration, preferences
- `onboarding/` - Initial API setup screen

### Core Utilities
- `lib/core/theme/app_theme.dart` - Light/dark themes
- `lib/core/errors/` - Error handling with `AppError`
- `lib/core/router/app_router.dart` - Navigation with auth guards
- `lib/core/constants/app_constants.dart` - App-wide constants

### Localization
- `lib/l10n/app_localizations.dart` - EN/ZH localization
- Uses `flutter_localizations`

## API Keys Required
- Claude API key (required for roadmap/flashcard generation)
- Exa API key (optional, for resource search)

Keys stored in SharedPreferences via `claudeApiKeyProvider` and `exaApiKeyProvider`.

## Test
Only one smoke test exists in `test/widget_test.dart`. The codebase lacks comprehensive tests.

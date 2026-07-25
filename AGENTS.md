# AGENTS.md - Development Guidelines

## Quick Reference

This file contains essential rules for AI assistants and developers working on this codebase.

---

## CRITICAL RULES (Non-Negotiable)

### 1. State Management
- **MUST use Riverpod** - no exceptions
- **NEVER use setState()** - always StateNotifier or StateProvider
- All widgets needing state: `ConsumerWidget` or `ConsumerStatefulWidget`
- Use `ref.watch()` for reactive, `ref.read()` for one-time access

### 2. File Size Limit
- **MAX 150 lines** per Dart file in `src/feature/`
- If exceeds 150 lines → split into smaller files
- Exception: only break if splitting causes serious architectural issues
- Always run: `dart format .` after editing

### 3. Code Cleanliness
- Keep code clean and readable
- Use meaningful names (no abbreviations)
- No magic numbers - use constants
- Remove unused imports/code
- Single responsibility per method

---

## File Organization

### ViewModels/Controllers
```
feature/<feature_name>/presentation/view_model/
├── <feature>_view_model.dart
└── <feature>_provider.dart (if needed)
```

### Data Layer
```
feature/<feature_name>/data/
├── model/
│   ├── <model>.dart
│   └── <model>.g.dart
└── repository/
    └── <feature>_repository_impl.dart
```

### Domain Layer
```
feature/<feature_name>/domain/
├── repository/
│   └── <feature>_repository.dart (abstract)
└── provider/
    └── <feature>_repository_provider.dart
```

---

## Screen Parts (Multiple Tabs/Sections)

If a screen has multiple distinct parts (tabs, sections), create separate folders:

### Example Structure
```
home_screen/
├── home_screen.dart              # Main container
├── home_tab_screen.dart          # Tab 1
├── service_tab_screen.dart       # Tab 2
├── home_tab_widgets/             # Tab 1 widgets
│   └── home_card.dart
└── service_tab_widgets/          # Tab 2 widgets
    └── service_card.dart
```

### Part Rules
- Each part gets its own subfolder
- Part widgets used ONLY by that part
- Shared widgets → `src/widgets/` instead
- Main screen should be thin (container/navigation only)
- Each part file ≤ 150 lines

---

## Code Splitting Strategy

When file > 150 lines, split by:

1. **Extract widgets** → separate files
2. **Extract logic** → view_model
3. **Extract constants** → const files
4. **Use theme extensions** → for colors/spacing

### Splitting Example
**Before (200 lines):**
- `login_screen.dart` (form + validation + submit)

**After:**
- `login_screen.dart` (50 lines) - Container
- `login_form.dart` (80 lines) - Form widget
- `login_validators.dart` (30 lines) - Validation

---

## Verification Commands

```bash
# Format all files
dart format .

# Check line counts
find lib/ -name "*.dart" -exec wc -l {} + | sort -nr | head -20

# Run analyzer
dart analyze

# Build runner
dart run build_runner build --delete-conflicting-outputs
```

---

## Widget Extraction Rules

Extract a widget when:
- `build()` exceeds 80 lines
- Same UI pattern 3+ times
- Needs own state management
- Complex animations/gestures
- Feature-specific components

### Naming Conventions
- Parent: `<feature>_screen.dart`
- Parts: `<feature>_<part>_screen.dart` or `<part>_widget.dart`
- Components: `<descriptive_name>.dart`

---

## Quick Checklist for New Features

- [ ] Use Riverpod (no setState)
- [ ] Files ≤ 150 lines
- [ ] Run `dart format .`
- [ ] ViewModel in `presentation/view_model/`
- [ ] Models in `data/model/`
- [ ] Abstract repos in `domain/repository/`
- [ ] Parts in separate folders if multi-tab
- [ ] Run `dart analyze`
- [ ] Run `build_runner` if models added

---

## Common Mistakes to Avoid

1. Using setState() instead of Riverpod
2. Files exceeding 150 lines
3. Not running dart format after edits
4. Putting business logic in widgets
5. Importing across features
6. Not splitting complex screens
7. Magic numbers in code
8. Unused imports

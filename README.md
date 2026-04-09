# Freelance CRM

A Rails-based CRM designed for freelancers to manage clients, notes, and workflows in a single, streamlined interface.

Built to explore how a simple, user-focused system can replace fragmented tools like spreadsheets and notes with a cohesive application.

## Overview

Freelance CRM focuses on:

- Managing client relationships
- Capturing contextual notes
- Organizing information through tagging
- Providing a fast, responsive UI for day-to-day workflows

The goal is to prioritize simplicity and usability over feature bloat.

## Tech Stack
- Ruby on Rails 8
- PostgreSQL
- Hotwire (Turbo + Stimulus)
- Tailwind CSS
- Devise (authentication)

## Key Features
- Client CRUD with clean, card-based UI
- Contextual notes tied to each client
- Tagging system with inline management
- Real-time UI updates using Turbo
- User-level data isolation

## Implementation Highlights
- Leveraged Hotwire to reduce frontend complexity while maintaining a responsive UX
- Designed relational data models for clients, notes, and tags
- Implemented inline interactions without full page reloads
- Focused on keeping UI logic close to Rails rather than introducing heavy frontend frameworks

## Current Status
- Core client and note management complete
- Tagging system implemented with real-time updates
- UI and workflows functional for day-to-day use

This project is intentionally scoped as a foundation for exploring workflow design and UI simplicity in Rails applications.

## Prerequisites

Before you begin, ensure you have the following installed:

- Ruby 3.4.3 or higher
- PostgreSQL
- Node.js (for package management)
- Git

## Running Locally
```bash
bundle install
rails db:create db:migrate db:seed
rails server
```




## Project Structure

```
app/
  controllers/
  models/
  views/
config/
db/ 
```

## Design Goals
Keep the interface simple and fast
Reduce friction in common workflows
Favor maintainability over complexity
Use Rails-native tools where possible

## Future Exploration
- Project and task tracking
- Basic reporting / insights
- Improved workflow customization

## License
MIT

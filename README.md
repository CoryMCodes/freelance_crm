# Freelance CRM

A modern, feature-rich CRM system built specifically for freelancers to manage clients, projects, tasks, and invoices all in one place. Built with Ruby on Rails 8 and modern web technologies for a seamless, professional experience.

## 🎯 Purpose

Freelance CRM addresses the unique needs of independent professionals who need to manage multiple clients, track projects, and handle invoicing efficiently. Unlike generic CRM systems, it's designed specifically for freelancers with features like time tracking, project management, and streamlined invoicing workflows.

## 🚀 Current Features

### ✅ **Phase 1: Foundation & Client Management** _(COMPLETED)_

- **🔐 Authentication System** - Secure user registration and login with Devise
- **👥 Client Management** - Full CRUD operations with beautiful card-based interface
- **📝 Notes System** - Add and manage contextual notes for each client
- **🏷️ Advanced Tagging System** - Color-coded tags with inline management
- **📱 Responsive Design** - Modern UI that works perfectly on all devices
- **⚡ Real-time Updates** - Built with Turbo and Stimulus for seamless interactions
- **🎨 Professional UI** - Clean, modern interface using Tailwind CSS

### 🔧 **Technical Highlights**

- **Inline Tag Management** - Add/remove tags directly from client cards
- **Real-time Synchronization** - Dropdown updates instantly when tags are modified
- **User Data Isolation** - Each user only sees their own data
- **Form Validation** - Server-side validation with user-friendly error messages
- **CSRF Protection** - Built-in Rails security features

## 🛠 Tech Stack

- **Ruby on Rails 8.0.2** - Modern Rails with Hotwire for real-time features
- **PostgreSQL** - Robust database for data persistence and complex relationships
- **Devise** - Industry-standard authentication and user management
- **Tailwind CSS** - Utility-first CSS framework for beautiful, responsive UI
- **Turbo** - Real-time page updates without full page refreshes
- **Stimulus** - Lightweight JavaScript framework for interactive components
- **Importmaps** - Modern JavaScript module loading without build tools

## 📋 Prerequisites

Before you begin, ensure you have the following installed:

- Ruby 3.4.3 or higher
- PostgreSQL
- Node.js (for package management)
- Git

## 🚀 Getting Started

### 1. Clone the Repository

```bash
git clone <repository-url>
cd freelance_crm
```

### 2. Install Dependencies

```bash
# Install Ruby gems
bundle install

# Install Node.js packages (if needed)
npm install
```

### 3. Database Setup

```bash
# Start PostgreSQL (if not already running)
brew services start postgresql@16

# Create and setup the database
rails db:create
rails db:migrate
rails db:seed
```

### 4. Start the Server

```bash
rails server
```

Visit `http://localhost:3000` to access the application.

## 👤 First Time Setup

1. **Register an Account**: Visit the application and create your first account
2. **Sample Data**: The seed data will create sample tags and a demo client
3. **Start Managing**: Begin adding your own clients and notes

## 📱 Usage Guide

### Getting Started

1. **Register an Account**: Create your account with email and password
2. **Access Dashboard**: View your personalized dashboard with client overview
3. **Sample Data**: Pre-loaded with sample tags and demo client for testing

### Client Management

- **📋 Client Cards**: Beautiful grid layout showing all client information at a glance
- **➕ Add Clients**: Create new client records with contact details and company info
- **✏️ Edit Clients**: Update client information, contact details, and address
- **👁️ Client Details**: View comprehensive client information with notes and tags
- **🗑️ Delete Clients**: Remove clients with confirmation dialog for safety

### Advanced Features

- **📝 Notes System**: Add contextual notes to any client with timestamps
- **🏷️ Inline Tag Management**: Add/remove tags directly from client cards
- **🎨 Color-coded Tags**: VIP, Regular, Prospect, Inactive, High Priority with distinct colors
- **⚡ Real-time Updates**: All changes happen instantly without page refreshes
- **📱 Mobile Responsive**: Works perfectly on desktop, tablet, and mobile devices

## 🏗 Project Structure

```
freelance_crm/
├── app/
│   ├── controllers/
│   │   ├── clients_controller.rb    # Client CRUD operations
│   │   ├── notes_controller.rb      # Notes management
│   │   ├── tags_controller.rb       # Tag management
│   │   └── home_controller.rb       # Dashboard
│   ├── models/
│   │   ├── client.rb               # Client model with validations
│   │   ├── note.rb                 # Note model
│   │   ├── tag.rb                  # Tag model
│   │   ├── client_tag.rb           # Join model for client-tag relationship
│   │   └── user.rb                 # User model with Devise
│   ├── views/
│   │   ├── clients/                # Client views (index, show, new, edit)
│   │   ├── home/                   # Dashboard view
│   │   └── layouts/                # Application layout
│   └── assets/
│       └── stylesheets/
│           └── application.css     # Custom styles
├── config/
│   ├── routes.rb                   # Application routes
│   └── database.yml                # Database configuration
└── db/
    ├── migrate/                    # Database migrations
    └── seeds.rb                    # Sample data
```

## 🎨 UI/UX Features

- **Modern Design**: Clean, professional interface using Tailwind CSS
- **Responsive Layout**: Works perfectly on desktop, tablet, and mobile
- **Intuitive Navigation**: Easy-to-use navigation with clear call-to-actions
- **Visual Feedback**: Hover effects, transitions, and loading states
- **Accessibility**: Proper semantic HTML and ARIA labels

## 🔒 Security Features

- **User Authentication**: Secure login with Devise
- **Data Isolation**: Users only see their own data
- **CSRF Protection**: Built-in Rails security
- **Input Validation**: Server-side validation for all forms
- **SQL Injection Protection**: ActiveRecord prevents SQL injection

## 🧪 Testing

```bash
# Run the test suite
rails test

# Run specific tests
rails test test/controllers/clients_controller_test.rb
```

## 🚀 Deployment

### Development

```bash
rails server
```

### Production

The application is configured for deployment with:

- PostgreSQL database
- Asset compilation
- Environment variables
- Docker support (Dockerfile included)

## 🆘 Support

If you encounter any issues or have questions:

1. Check the Rails logs for error messages
2. Ensure PostgreSQL is running
3. Verify all dependencies are installed
4. Check that the database is properly migrated

## 🗺️ Development Roadmap

### 🚧 **Phase 2: Project Management** _(NEXT)_

- [ ] **Project CRUD Operations** - Create, edit, and manage projects for each client
- [ ] **Project-Client Relationships** - Link projects to specific clients
- [ ] **Project Status Tracking** - Track project progress and completion status
- [ ] **Project Timeline View** - Visual timeline of project milestones

### 🔄 **Phase 3: Task Management**

- [ ] **Task Creation & Assignment** - Create tasks within projects
- [ ] **Time Tracking** - Built-in time tracking for tasks and projects
- [ ] **Task Status Updates** - Track task progress and completion
- [ ] **Task Dependencies** - Link related tasks and manage workflows

### 💰 **Phase 4: Invoice System**

- [ ] **Invoice Creation Wizard** - Step-by-step invoice creation
- [ ] **Line Item Management** - Add services, products, and expenses
- [ ] **Tax & Discount Calculations** - Automatic tax and discount calculations
- [ ] **PDF Generation** - Professional invoice PDFs
- [ ] **Payment Tracking** - Track invoice payments and status

### 📊 **Phase 5: Analytics & Reporting**

- [ ] **Earnings Dashboard** - Visual earnings tracking and trends
- [ ] **Client Performance Metrics** - Analyze client profitability
- [ ] **Time Tracking Reports** - Detailed time and productivity reports
- [ ] **Export Functionality** - Export data to CSV, PDF, and other formats

### ⚡ **Phase 6: Advanced Real-time Features**

- [ ] **Live Time Tracking** - Real-time time tracking updates
- [ ] **Invoice Status Broadcasting** - Live invoice status changes
- [ ] **Inline Task Editing** - Edit tasks directly in the interface
- [ ] **Live Notifications** - Real-time notifications for important events
- [ ] **Collaborative Features** - Team collaboration and sharing

## 🎯 Current Development Status

**Phase 1 Complete** ✅ - Foundation and client management system is fully functional with advanced features like inline tag management and real-time updates.

**Next Focus** 🎯 - Project management system to build upon the solid client foundation.

---

**Built with ❤️ using Ruby on Rails 8 and Tailwind CSS**

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Create sample tags
if User.count > 0
  user = User.first

  # Create some default tags
  tags = [
    { name: "VIP", color: "#dc2626" },
    { name: "Regular", color: "#2563eb" },
    { name: "Prospect", color: "#059669" },
    { name: "Inactive", color: "#6b7280" },
    { name: "High Priority", color: "#ea580c" }
  ]

  tags.each do |tag_attrs|
    user.tags.find_or_create_by(name: tag_attrs[:name]) do |tag|
      tag.color = tag_attrs[:color]
    end
  end

  # Create a sample client
  client = user.clients.find_or_create_by(email: "john@example.com") do |c|
    c.name = "John Smith"
    c.phone = "+1 (555) 123-4567"
    c.company = "Smith Enterprises"
    c.address = "123 Main Street\nNew York, NY 10001"
  end

  # Add some tags to the client
  client.tags << user.tags.where(name: [ "VIP", "High Priority" ])

  # Add a sample note
  client.notes.find_or_create_by(content: "Initial contact made. Very interested in our services.") do |note|
    note.user = user
  end

  puts "Seed data created successfully!"
  puts "Created #{user.tags.count} tags"
  puts "Created #{user.clients.count} clients"
  puts "Created #{user.notes.count} notes"
else
  puts "No users found. Please create a user account first."
end

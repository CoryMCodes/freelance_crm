import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["tag", "form", "input", "list"]
  static values = { clientId: Number }

  connect() {
    console.log("Tags controller connected")
  }

  addTag(event) {
    event.preventDefault()
    const form = event.target.closest("form")
    const formData = new FormData(form)
    const tagId = formData.get('tag_id')
    
    console.log(`Adding tag ${tagId} to client`)
    
    fetch(form.action, {
      method: "POST",
      body: formData,
      headers: {
        "X-CSRF-Token": document.querySelector('meta[name="csrf-token"]').content
      }
    })
    .then(response => response.json())
    .then(data => {
      if (data.success) {
        console.log("Tag added successfully:", data.tag)
        this.addTagToClient(data.tag)
        form.reset()
        this.hideAddForm()
      } else {
        console.error("Failed to add tag:", data.errors)
      }
    })
    .catch(error => {
      console.error("Error adding tag:", error)
    })
  }

  removeTag(event) {
    event.preventDefault()
    const tagId = event.target.dataset.tagId
    const clientId = this.clientIdValue
    const removedTag = event.target.closest(".tag-item")
    const tagName = removedTag.dataset.tagName
    const tagColor = removedTag.style.color
    
    console.log(`Removing tag ${tagId} (${tagName}) from client ${clientId}`)
    
    fetch(`/clients/${clientId}/tags/${tagId}`, {
      method: "DELETE",
      headers: {
        "X-CSRF-Token": document.querySelector('meta[name="csrf-token"]').content
      }
    })
    .then(response => response.json())
    .then(data => {
      if (data.success) {
        console.log("Tag removed successfully:", data.tag)
        // Remove the tag from the display
        removedTag.remove()
        
        // Add the tag back to the dropdown
        this.addTagToDropdown(tagId, tagName, tagColor)
      } else {
        console.error("Failed to remove tag:", data.errors)
      }
    })
    .catch(error => {
      console.error("Error removing tag:", error)
    })
  }

  addTagToClient(tagData) {
    console.log("Adding tag to client display:", tagData)
    const tagHtml = `
      <span class="tag-item inline-flex items-center px-2 py-1 text-xs rounded-full mr-2 mb-2" 
            style="background-color: ${tagData.color}20; color: ${tagData.color};"
            data-tag-id="${tagData.id}"
            data-tag-name="${tagData.name}">
        ${tagData.name}
        <button data-action="click->tags#removeTag" 
                data-tag-id="${tagData.id}" 
                class="ml-1 text-xs hover:opacity-75">
          ×
        </button>
      </span>
    `
    this.listTarget.insertAdjacentHTML('beforeend', tagHtml)
    
    // Remove the tag from the dropdown
    this.removeTagFromDropdown(tagData.id)
  }

  addTagToDropdown(tagId, tagName, tagColor) {
    const select = this.inputTarget
    const option = document.createElement('option')
    option.value = tagId
    option.textContent = tagName
    option.style.color = tagColor
    
    // Insert after the first option (placeholder)
    select.insertBefore(option, select.children[1])
    console.log(`Added tag ${tagName} to dropdown`)
  }

  removeTagFromDropdown(tagId) {
    const select = this.inputTarget
    const option = select.querySelector(`option[value="${tagId}"]`)
    if (option) {
      option.remove()
      console.log(`Removed tag ${tagId} from dropdown`)
    }
  }

  showAddForm() {
    this.formTarget.classList.remove("hidden")
    this.inputTarget.focus()
  }

  hideAddForm() {
    this.formTarget.classList.add("hidden")
  }
} 
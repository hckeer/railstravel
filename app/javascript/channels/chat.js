// app/javascript/channels/chat.js
import consumer from "./consumer"

consumer.subscriptions.create("ChatChannel", {
  connected() {
    console.log("Connected to chat channel")
  },

  disconnected() {
    console.log("Disconnected from chat channel")
  },

  received(data) {
    const messages = document.getElementById('messages')
    messages.insertAdjacentHTML('beforeend', data)
    messages.scrollTop = messages.scrollHeight
  }
})
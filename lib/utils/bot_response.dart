/// This function returns a bot response based on the message sent by the user.
String getBotResponse(String message) {
  switch (message.toLowerCase()) {
    case 'hello':
      return 'Hello, how can I help?';
    case 'thank you!':
      return "You're welcome!";
    case 'see you later!':
      return 'Hope to see you soon!';
    case 'good morning':
      return 'Good morning to you!';
    case 'good afternoon':
      return 'Good afternoon to you!';
    case 'what are your functions?':
      return 'I can help you chat, send pictures, and more!';
    default:
      return 'Message received!';
  }
}

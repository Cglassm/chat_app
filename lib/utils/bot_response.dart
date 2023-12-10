/// This function returns a bot response based on the message sent by the user.
String getBotResponse(String message) {
  switch (message) {
    case 'Hello':
      return 'Hello, how can I help?';
    case 'Thank you!':
      return "You're welcome!";
    case 'See you later!':
      return 'Hope to see you soon!';
    case 'Good morning':
      return 'Good morning to you!';
    case 'Good afternoon':
      return 'Good afternoon to you!';
    case 'What are your functions?':
      return 'I can help you chat, send pictures, and more!';
    default:
      return 'Message received!';
  }
}

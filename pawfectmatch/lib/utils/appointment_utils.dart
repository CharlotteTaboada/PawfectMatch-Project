import 'package:cloud_firestore_platform_interface/src/timestamp.dart';
import 'package:intl/intl.dart';
import 'package:pawfectmatch/controller/chat_control.dart';
import 'package:pawfectmatch/screens/chat_screen.dart';

Future<void> sendAppointmentDetailsToChat(String convoID, String senderID, String receiverID, String selectedDog, DateTime selectedDateTime) async {
  try {
    String formattedDateTime = DateFormat('EEE, MMM d, y h:mm a').format(selectedDateTime);

    // Create a message body with appointment details
    String messageBody = 'New Appointment:\nDog: $selectedDog\nDate and Time: $formattedDateTime';
    String missingArgumentValue = 'default'; // Replace 'default' with the actual default value

    // Send the message to the chat using your existing messaging logic
    sendMessage(convoID, senderID, receiverID, messageBody, missingArgumentValue as Timestamp);
    await ChatScreen(otherDogName: '', otherDogPhotoUrl: '', convoID: '', otherUser: '',).fetchConversation(convoID);
  } catch (error) {
    print('Error sending appointment details to chat: $error');
  }
}

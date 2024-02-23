List<dynamic> findCommonSlot(List<List<List<int>>> meetings) {
  // Initialize a list to store the availability of each time slot
  List<int> availabilityHours = [];

  // Iterate over each diplomat's available time slots and mark each time slot as available
  for (List<List<int>> diplomatMeetings in meetings) {
    for (List<int> meetingTime in diplomatMeetings) {
      for (int i = meetingTime[0]; i < meetingTime[1]; i++) {
        availabilityHours.add(i);
      }
    }
  }

  // Sort the availability hours
  availabilityHours.sort();

  List<int> commonAvailabilityHours = [];
  int countCommonSlot = 0;

  // Find common slots in availability hours
  for (int i = 0; i < availabilityHours.length - 1; i++) {
    if (availabilityHours[i] == availabilityHours[i + 1]) {
      countCommonSlot++;
      // Check if the slot is available for all diplomats
      if (countCommonSlot == meetings.length - 1) {
        commonAvailabilityHours.add(availabilityHours[i]);
      }
    } else {
      countCommonSlot = 0;
    }
  }

  if (commonAvailabilityHours.isEmpty) {
    return ['No common slot available'];
  }

  // Convert common availability hours to meeting time slots
  List<List<int>> availableMeetingHours =
      commonAvailabilityHours.map((hour) => [hour, hour + 1]).toList();

  return availableMeetingHours.length == 1
      ? availableMeetingHours.first
      : availableMeetingHours;
}

void main() {
  // Test case 1
  List<List<List<int>>> meetings1 = [
    [
      [9, 12],
      [14, 16]
    ],
    [
      [10, 12],
      [15, 17]
    ],
    [
      [11, 13],
      [16, 18]
    ]
    //add the schedules of the other diplomat
  ];
  print("Case 1:");
  print("Input: $meetings1");
  print("Output: ${findCommonSlot(meetings1)}");

  // Test case 2
  List<List<List<int>>> meetings2 = [
    [
      [8, 10],
      [12, 14],
      [9, 11]
      //add the schedules of the other diplomat
    ]
  ];
  print("\nCase 2:");
  print("Input: $meetings2");
  print("Output: ${findCommonSlot(meetings2)}");
}

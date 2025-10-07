
# 1. Welcome Message Function
def welcome_message(name):
    return "Welcome, " + name + "!"

print("Welcome Message:")
print(welcome_message("Alice"))
print()

# 2. Largest Number Function
def larg_num(a, b, c):
    if a >= b and a >= c:
        return a
    elif b >= a and b >= c:
        return b
    else:
        return c

print("Largest Number:")
print("Largest:", larg_num(12, 55, 37))
print()

# 3. Digits in Words
def print_digits_in_words(number):
    if number < 100 or number > 999:
        print("Enter a three-digit number")
        return

    words = ["zero", "one", "two", "three", "four", 
             "five", "six", "seven", "eight", "nine"]
    print("Digits in words:")
    for digit in str(number):
        print(words[int(digit)])

print("Print Digits in Words:")
print_digits_in_words(425)
print()

# 4. Meeting Room and Booking System

# MeetingRoom base class
class MeetingRoom:
    def __init__(self, room_id, capacity, floor_location):
        self.room_id = room_id
        self.capacity = capacity
        self.floor_location = floor_location

# ZoomMeetingRoom subclass
class ZoomMeetingRoom(MeetingRoom):
    def __init__(self, room_id, capacity, floor_location, zoom_device_id, zoom_account_id):
        super().__init__(room_id, capacity, floor_location)
        self.zoom_device_id = zoom_device_id
        self.zoom_account_id = zoom_account_id

# Booking class
class Booking:
    def __init__(self, employee_id, room, date, time, duration):
        self.employee_id = employee_id
        self.room = room
        self.date = date
        self.time = time
        self.duration = duration

# BookingManager class
class BookingManager:
    def __init__(self):
        self.bookings = {}

    def add_booking(self, booking):
        if booking.date not in self.bookings:
            self.bookings[booking.date] = []
        self.bookings[booking.date].append(booking)

    def show_bookings(self, date):
        if date in self.bookings:
            for b in self.bookings[date]:
                print("Employee:", b.employee_id)
                print("Room:", b.room.room_id)
                print("Date:", b.date)
                print("Time:", b.time)
                print("Duration:", b.duration, "minutes")
                print("---")
        else:
            print("No bookings on", date)

print("Meeting Room Booking System:")
# Create rooms
room1 = MeetingRoom("R101", 8, 1)
room2 = ZoomMeetingRoom("R202", 12, 2, "ZD01", "ZA100")

# Create bookings
b1 = Booking("E101", room1, "2025-10-07", "09:00", 60)
b2 = Booking("E102", room2, "2025-10-07", "10:30", 45)

# Manage bookings
manager = BookingManager()
manager.add_booking(b1)
manager.add_booking(b2)

# Show bookings for a day
manager.show_bookings("2025-10-07")

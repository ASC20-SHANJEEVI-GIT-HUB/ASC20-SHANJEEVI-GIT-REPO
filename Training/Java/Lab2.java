
// 1. Define Classes, Attributes, Methods, and Their Connections

class Room {
    private String id;
    private int maxCap;
    private int floorNum;

    public Room(String id, int maxCap, int floorNum) {
        this.id = id;
        this.maxCap = maxCap;
        this.floorNum = floorNum;
    }

    public String getId() {
        return id;
    }

    public int getMaxCap() {
        return maxCap;
    }

    public int getFloorNum() {
        return floorNum;
    }
}

class ZoomEnabledRoom extends Room {
    private String zoomDeviceCode;
    private String zoomAccountCode;

    public ZoomEnabledRoom(String id, int maxCap, int floorNum, String zoomDeviceCode, String zoomAccountCode) {
        super(id, maxCap, floorNum);
        this.zoomDeviceCode = zoomDeviceCode;
        this.zoomAccountCode = zoomAccountCode;
    }

    public String getZoomDeviceCode() {
        return zoomDeviceCode;
    }

    public String getZoomAccountCode() {
        return zoomAccountCode;
    }
}

class Reservation {
    private String employeeId;
    private String date;
    private String timeSlot;
    private int lengthInMinutes;
    private Room bookedRoom;

    public Reservation(String employeeId, String date, String timeSlot, int lengthInMinutes, Room bookedRoom) {
        this.employeeId = employeeId;
        this.date = date;
        this.timeSlot = timeSlot;
        this.lengthInMinutes = lengthInMinutes;
        this.bookedRoom = bookedRoom;
    }

    public String getEmployeeId() {
        return employeeId;
    }

    public String getDate() {
        return date;
    }

    public String getTimeSlot() {
        return timeSlot;
    }

    public int getLengthInMinutes() {
        return lengthInMinutes;
    }

    public Room getBookedRoom() {
        return bookedRoom;
    }
}

// 2. Welcome Message Method and other utilities

public class Lab2Revised {

    // Returns a personalized welcome message
    public static String greetUser(String userName) {
        return "Hello " + userName + ", Welcome to Java World!";
    }

    // Returns the largest among three numbers
    public static int findLargest(int num1, int num2, int num3) {
        return Math.max(num1, Math.max(num2, num3));
    }

    // Prints each digit of a 3-digit number in word form
    public static void displayDigitsInWords(int number) {
        String[] digitWords = {"Zero", "One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine"};
        String numberStr = String.valueOf(number);
        for (char ch : numberStr.toCharArray()) {
            System.out.print(digitWords[ch - '0'] + " ");
        }
        System.out.println();
    }

    public static void main(String[] args) {
        System.out.println(greetUser("Shanjeevi"));
        System.out.println("Largest value is: " + findLargest(55, 98, 33));
        System.out.print("Number in words: ");
        displayDigitsInWords(856);
    }
}

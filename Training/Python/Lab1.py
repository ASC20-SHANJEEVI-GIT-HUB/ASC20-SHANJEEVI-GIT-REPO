
#  1. Function Overloading (Python Style)
def add(*args):
    if all(isinstance(arg, (int, float)) for arg in args):
        return sum(args)
    else:
        return ' '.join(str(arg) for arg in args)

print("Function Overloading:")
print(add(10, 20))         
print(add(10, 20, 30))     
print(add(10.5, 20.1))     
print(add("Hello", 20))   
print()

#  2. Student Class
class Student:
    def __init__(self):
        self.student_id = 0
        self.student_name = ""
        self.city = ""
        self.marks1 = 0
        self.marks2 = 0
        self.marks3 = 0
        self.fee_per_month = 0.0
        self.is_eligible_for_scholarship = False

    # Setters
    def set_data(self, sid, name, city, m1, m2, m3, fee, scholarship):
        self.student_id = sid
        self.student_name = name
        self.city = city
        self.marks1 = m1
        self.marks2 = m2
        self.marks3 = m3
        self.fee_per_month = fee
        self.is_eligible_for_scholarship = scholarship

    # Getters
    def get_annual_fee(self):
        return self.fee_per_month * 12

    def get_total_marks(self):
        return self.marks1 + self.marks2 + self.marks3

    def get_average(self):
        return self.get_total_marks() / 3

    def get_result(self):
        if self.marks1 > 60 and self.marks2 > 60 and self.marks3 > 60:
            return "Pass"
        else:
            return "Fail"

print("Student Class:")

# Create students
s1 = Student()
s2 = Student()
s3 = Student()

s1.set_data(1, "Alice", "New York", 80, 85, 78, 2000, True)
s2.set_data(2, "Bob", "Los Angeles", 60, 59, 62, 1500, False)
s3.set_data(3, "Charlie", "Chicago", 90, 88, 95, 1800, True)

students = [s1, s2, s3]

# Highest total marks
highest = max(students, key=lambda s: s.get_total_marks())
print(f"Highest marks: {highest.student_name}")

# Lowest fee
lowest_fee = min(students, key=lambda s: s.fee_per_month)
print(f"Lowest fee: {lowest_fee.student_name} - ${lowest_fee.fee_per_month}")

# Details
for s in students:
    print(f"{s.student_name} | Total: {s.get_total_marks()} | Avg: {s.get_average():.2f} | Result: {s.get_result()} | Scholarship: {s.is_eligible_for_scholarship}")
print()

# 3. Multiplication Table
def table_for(n):
    print("Multiplication loop:")
    for i in range(1, 11):
        print(f"{n} x {i} = {n*i}")

def table_while(n):
    print("Multiplication while loop:")
    i = 1
    while i <= 10:
        print(f"{n} x {i} = {n*i}")
        i += 1

def table_do_while(n):
    print("Multiplication do-while:")
    i = 1
    while True:
        print(f"{n} x {i} = {n*i}")
        i += 1
        if i > 10:
            break

print("Multiplication Tables:")
table_for(2)
print()
table_while(2)
print()
table_do_while(2)
print()

#  4. Word Count
def word_count(text):
    return len(text.split())

print("Word Count:")
sentence = "Sum of 12 and 20 is 32"
print(f"Input: '{sentence}' → Word Count: {word_count(sentence)}")
print()

#  5. String Methods
print("String Methods:")

text = " Hello Python World! "
print(f"Original text: '{text}'")
print("Indexing:", text[1])
print("'Python' in text:", 'Python' in text)
print("Length:", len(text))
print("Find 'Python':", text.find('Python'))
print("Equality:", text.strip() == "Hello Python World!")
print("Case-insensitive equality:", text.strip().lower() == "hello python world!".lower())
print("Join:", "-".join(["A", "B", "C"]))
print("rfind 'o':", text.rfind('o'))
print("Slicing [1:6]:", text[1:6])
print("Lower:", text.lower())
print("Upper:", text.upper())
print("Strip:", text.strip())
print()

# 6. ArrayStore Class
class ArrayStore:
    def __init__(self):
        self.arr = []

    def accept_numbers(self):
        print("Enter 10 integers:")
        for _ in range(10):
            self.arr.append(int(input()))

    def display_for(self):
        print("for loop:")
        for num in self.arr:
            print(num, end=' ')
        print()

    def display_while(self):
        print(" while loop:")
        i = 0
        while i < len(self.arr):
            print(self.arr[i], end=' ')
            i += 1
        print()

    def sort_array(self):
        self.arr.sort()

    def count_occurrence(self, number):
        return self.arr.count(number)

    def insert_at(self, index, number):
        if 0 <= index < len(self.arr):
            self.arr.insert(index, number)
        else:
            print("Index out of range!")

    def get_unique_elements(self):
        return list(set(self.arr))

print("ArrayStore Class:")
store = ArrayStore()
store.arr = [9, 2, 2, 9, 10, 9, 4, 5, 2, 3]
store.display_for()
store.display_while()
store.sort_array()
print("Sorted:", store.arr)
print("Count of 9:", store.count_occurrence(9))
store.insert_at(2, 100)
print("After insertion:", store.arr)
print("Unique elements:", store.get_unique_elements())

#first we print the list of students
# students = [
#  {name: "Dr.Hannibal Lecter", cohort: :november},
#  {name: "Darth Vader", cohort: :november}
#  {name: "Nurse Ratched", cohort: :november},
#  {name: "Michael Corleone", cohort: :november},
#  {name: "Alex DeLarge", cohort: :november},
#  {name: "The Wicked Witch of the West", cohort: :november},
#  {name: "Terminator", cohort: :november},
#  {name: "Freddy Krueger", cohort: :november},
#  {name: "The Joker", cohort: :november},
#  {name: "Joffrey Baratheon", cohort: :november},
#  {name: "Norman Bates", cohort: :november}
# ]

def input_students
  puts "Please enter the names of the students"
  puts "To finish, please enter 'return' twice"
  students = []
  name = gets.chomp
  # if name.length == 0
  #   name = "A studen has no name"
  # end
  while !name.empty? do
    puts "How old is the student"
    age = gets.chomp
    student_age = "The student has #{age} years old"
    if age.length == 0
      student_age = "a student has no age"
    end

    puts "Student height"
    height = gets.chomp
    student_height = "The student is #{} feet tall"
    if height.length == 0
      student_height = "A student has no height"
    end

    puts "What cohort is the student in"
    cohort = gets.chomp
    student_cohort = "#{cohort} Cohort"
    if cohort.length == 0
      student_cohort = "a student has no Cohort"
    end

    students << {name: name, student_age: student_age, student_height: student_height, student_cohort: student_cohort}
    puts "Now we have #{students.count} students"
    name = gets.chomp
  end
  students
end

def print_header
puts "The students of Villains Academy".center(50)
puts "----------------".center(50)
end

def print(students)
  filtered_students = []
  i = 0
  while i < students.length
    student = students[i]
    if student[:name].downcase.chars.first == 'a' && student[:name].length <= 12
      filtered_students << student
    end
    i += 1
  end
  filtered_students.each_with_index do |student, index|
  puts "#{index + 1}. #{student[:name]} , #{student[:student_age]}. #{student[:student_height]} (#{student[:student_cohort]})".center(50)
  end
end

def print_footer(students)
  puts "Overal, we have #{students.count} great students ".center(50)
end
#Nothing happens until we call the methods

students = input_students
print_header
print(students)
print_footer(students)

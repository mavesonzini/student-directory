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
#
def print_header
puts "The students of Villains Academy".center(50)
puts "----------------".center(50)
end

def print(students)
  filtered_students = []
  students.each do |student|
    if student[:name].downcase.chars.first == 'a' && student[:name].length <= 12
      filtered_students << student
      filtered_students.each_with_index do |name, index|
      puts "#{index + 1}. #{name[:name]} (#{student[:cohort]} cohort)".center(50)
      end
    end
  end
end

def print_footer(students)
  puts "Overal, we have #{students.count} great students ".center(50)
end
#Nothing happens until we call the methods
def input_students
  puts "Please enter the names of the students"
  puts "To finish, please enter 'return' twice"

  # create an empty array
  students = []
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    # get another name from user
    name = gets.chomp
  end
  # Return de array of students
  students
end

students = input_students
print_header
print(students)
print_footer(students)

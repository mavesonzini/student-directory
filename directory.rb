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

@students = []

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list of students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end

def show_students
  print_header
  print_students_list
  print_footer
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      save_students
    when "4"
      load_students
    when "9"
      exit
    else puts "I don't know what you meant, try again"
  end
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, please enter 'return' twice"
  name = STDIN.gets.delete("\n")
  while !name.empty? do
    puts "How old is the student"
    age = gets.delete("\n")
    student_age = "The student has #{age} years old"
    if age.length == 0
      student_age = "A student has no age"
    end

    puts "Student height"
    height = gets.delete("\n")
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

    @students << {name: name, student_age: student_age, student_height: student_height, student_cohort: student_cohort}
      if @students.count == 1
        puts "Now we have 1 student"
      else
        puts "Now we have #{@students.count} students"
      end
    name = gets.delete("\n")
  end
  @students
end

def print_header
puts "The students of Villains Academy".center(50)
puts "----------------".center(50)
end

def print
  filtered_students = []
  i = 0
  while i < @students.length
    student = @students[i]
    if @student[:name].downcase.chars.first == 'a' && @student[:name].length <= 12
      filtered_students << student
    end
    i += 1
  end
  filtered_students.each_with_index do |student, index|
  puts "#{index + 1}. #{student[:name]}. #{student[:student_age]}. #{student[:student_height]} (#{student[:student_cohort]})".center(50)
  end
end

def print_student_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:student_cohort]} cohort)"
  end
end

# def group_by_cohorts
#   students_grouped_by_cohort = []
#   for student in @students
#     cohort_found = false
#     for subarray in students_grouped_by_cohort
#       if subarray.first[:student_cohort] == student[:student_cohort]
#         subarray << student
#         cohort_found = true
#         break
#       end
#     end
#     if cohort_found == false
#       subarray = []
#       subarray << student
#       students_grouped_by_cohort << subarray
#     end
#   end
#   return students_grouped_by_cohort
# end
#
# def print_footer
#   puts "Overal, we have #{@students.count} great students ".center(50)
# end

def save_students
    #the first argument is the name of the file I want to open. The second argument is the initian for read only,
    #write only, read and write, etc. r: read only, w:write only, w+: read and write (if the file exists, overites
    # everything in the file.) a+: read and write (if the file exists, starts at the end of the file. Otherwise creates a new file)
  file = File.open("students.csv", "w")
  @students.each do |student|
    student_data = [student[:name], student[:student_cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def load_students(filename = "students.csv")
  file = File.open("students.csv", "r")
  file.readlines.each do |line|
  name, cohort = line.chomp.split(',')
    @students << {name: name, cohort: cohort}
  end
  file.close
end

def try_load_students
  filename = ARGV.first
  return if filename.nil?
  if File.exists?(filename)
    load_students(filename)
      puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist."
    exit
  end
end


try_load_students
interactive_menu

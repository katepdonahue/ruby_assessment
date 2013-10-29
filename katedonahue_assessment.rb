# 1. Arrays

my_array = ["Blake", "Ashley", "Jeff"]
my_array.push "Kate"
puts my_array
my_array[1]
my_array.index "Jeff"

# 2. Hashes

instructor = { name: "Ashley", age: 27 }
instructor[:location] = "NYC"
instructor.each { |key, value| puts "#{key}: #{value}" }
instructor[:name]
instructor.key 27

# 3. Nested Structures

school = { 
  :name => "Happy Funtime School",
  :location => "NYC",
  :instructors => [ 
    {:name=>"Blake", :subject=>"being awesome" },
    {:name=>"Ashley", :subject=>"being better than blake"},
    {:name=>"Jeff", :subject=>"karaoke"}
  ],
  :students => [ 
    {:name => "Marissa", :grade => "B"},
    {:name => "Billy", :grade => "F"},
    {:name => "Frank", :grade => "A"},
    {:name => "Sophie", :grade => "C"}
  ]
}

school[:founded_in] = "2013"
school[:students].push ({:name => "Ja\'mie", :grade => "D"})
school[:students].delete (school[:students][1])
school[:students].each { |hash| hash[:semester] = "Summer" }
school[:instructors][1][:subject] = "being almost better than Blake"
school[:students][1][:grade] = "F"
school[:students].each do |hash| 
	if not(hash.key("B").nil?)
		hash[:name]
	end
end
school[:instructors].each do |hash| 
	if not(hash.key("Jeff").nil?)
		hash[:subject]
	end
end
school.each do |key, value|
	if value.is_a? String
		puts value
	else #value is an array of hashes
		value.each do |hash|
			hash.each { |key, value| puts value }
		end
	end
end

# 4. Methods

def student_grade(school_name, student_name)
	school_name[:students].each do |hash| 
		if hash[:name] == student_name
			return hash[:grade]
		end
	end
end

def update_subject(school_name, instructor_name, new_subject)
	school_name[:instructors].each do |hash|
		if hash[:name] == instructor_name
			hash[:subject] = new_subject
		end
	end
end

update_subject(school, "Blake", "being terrible")

def add_student(school_name, new_student)
	school_name[:students].push ({ name: new_student, grade: "none", semester: "none"})
end

add_student(school, "Kate")

def new_key(school_name, new_key, new_value)
	school_name[:"#{new_key}"] = new_value
end

new_key(school, "Ranking", "1")

# 5. Object Orientation

class School # an element of this class is a hash
	SCHOOLS = []
	def initialize (name, location, ranking)
		@name = name
		@location = location
		@ranking = ranking
		@instructors = []
		@students = []
		SCHOOLS.push (self)
	end
	attr_accessor :name, :location, :instructors, :students
	attr_reader :ranking
	def set_ranking(new_ranking)
		@ranking = new_ranking
	end
	def new_student(student_name, student_grade, student_semester)
		students.push ({ name: student_name, grade: student_grade, semester: student_semester})
	end
	def remove_student(rmv_name)
		students.each do |hash|
			if not(hash.key(rmv_name).nil?)
				students.delete (hash)
				puts "#{rmv_name} was removed."
			end
		end
	end
	def School.reset
		SCHOOLS.clear
	end
end

# 6. Classes

class Student
	def initialize(name, grade, semester)
		@name = name
		@grade = grade
		@semester = semester
	end
	attr_accessor :name, :grade, :semester
end

class School # an element of this class is a hash
	SCHOOLS = []
	def initialize (name, location, ranking)
		@name = name
		@location = location
		@ranking = ranking
		@instructors = []
		@students = []
		SCHOOLS.push (self)
	end
	attr_accessor :name, :location, :instructors, :students
	attr_reader :ranking
	def set_ranking(new_ranking)
		@ranking = new_ranking
	end
	def new_student(student_name, student_grade, student_semester)
		students.push Student.new(student_name, student_grade, student_semester)
	end
	def remove_student(rmv_name)
		students.each do |student_class_instance|
			if student_class_instance.name == rmv_name
				students.delete student_class_instance
				puts "#{rmv_name} was removed."
			end
		end
	end
	def School.reset
		SCHOOLS.clear
	end
	def find_student(student_name)
		students.each do |student_class_instance|
			if student_class_instance.name == student_name
				return student_class_instance
				puts "#{student_name} was found."
			end
		end	
	end
end

# 7. Self

# a.

hello
Student

# b.

Student

# c.

Student

# d.

puts class instance id

# e.

goodbye

	







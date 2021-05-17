class Bootcamp
    attr_reader :name, :slogan
    attr_accessor :teachers, :students, :grades
    def initialize(name, slogan, student_capacity)
        @name = name
        @slogan = slogan
        @student_capacity = student_capacity
        @teachers = Array.new
        @students = Array.new
        @grades = Hash.new { |hash, key| hash[key] = Array.new }
    end

    def hire(teacher)
        teachers << teacher
    end

    def enroll(student)
        students.length < @student_capacity ? students << student && true : false
    end

    def enrolled?(student)
        students.include?(student)
    end

    def student_to_teacher_ratio
        (students.length / teachers.length).to_i
    end

    def add_grade(student, grade)
        enrolled?(student) ? grades[student] << grade && true : false
    end

    def num_grades(student)
        grades[student].length
    end

    def average_grade(student)
        enrolled?(student) && num_grades(student) > 0 ? grades[student].sum / num_grades(student) : nil
    end
end

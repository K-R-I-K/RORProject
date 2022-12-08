class PagesController < ApplicationController
  def index
    @students = Student.all

    @students_with_debts = Student.all.select { |x| x.geom == 1 || x.alg == 1 || x.inf == 1 }

    @number_of_grades = Hash.new(0)
    @students.each do |x|
      @number_of_grades[x.geom] += 1
      @number_of_grades[x.alg] += 1
      @number_of_grades[x.inf] += 1
    end
    @percent_academic_performance = 0.0
    @students.each do |x|
      @percent_academic_performance += 1 if x.geom > 2
      @percent_academic_performance += 1 if x.alg > 2
      @percent_academic_performance += 1 if x.inf > 2
    end
    @percent_academic_performance *= 100
    @percent_academic_performance /= 3 * @students.length
    @percent_of_knowledge_quality = 0.0
    @students.each do |x|
      @percent_of_knowledge_quality += 1 if x.geom > 3
      @percent_of_knowledge_quality += 1 if x.alg > 3
      @percent_of_knowledge_quality += 1 if x.inf > 3
    end
    @percent_of_knowledge_quality *= 100
    @percent_of_knowledge_quality /= 3 * @students.length
    @degree_of_students_education = @number_of_grades[5] * 100 +
      @number_of_grades[4] * 64 +
      @number_of_grades[3] * 36 +
      @number_of_grades[2] * 16 +
      @number_of_grades[1] * 7
    @degree_of_students_education /= 3.0 * @students.length

    res = [0, 0, 0]
    @students.each do |x|
      res[0] += x.geom
      res[1] += x.alg
      res[2] += x.inf
    end
    @best_subject = "geometry" if res.max == res[0]
    @best_subject = "algebra" if res.max == res[1]
    @best_subject = "IT" if res.max == res[2]

    @groups_rating = groups_rating
  end

  def groups_rating
    @students = Student.all
    groups = Hash.new(0)
    @students.each do |x|
      groups[x.group] += x.geom + x.alg + x.inf
    end
    groups.sort_by(&:last)
    groups.keys
  end
end

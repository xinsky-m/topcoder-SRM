# https://community.topcoder.com/stat?c=problem_statement&pm=9824

class CorporationSalary
  def totalSalary(relations)
    @salaries = Array.new(relations.size, 0)
    @relations = relations
    total = 0
    relations.size.times do |i|
      total += getSalary(i)
    end
    total
  end

  def getSalary(i)
    if @salaries[i] == 0
      salary = 0
      relation = @relations[i]
      relation.size.times do |j|
        salary += getSalary(j)  if relation[j] == 'Y'
      end
      salary = 1 if salary == 0
      @salaries[i] = salary
    end
    @salaries[i]
  end
end

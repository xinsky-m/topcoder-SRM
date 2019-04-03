# https://community.topcoder.com/stat?c=problem_statement&pm=3971 

class StockHistory
  def maximiumEarnings(initialInvestment, monthlyContribution, stockPrices)
    month = stockPrices.size
    corp = stockPrices[0].split(' ').size
    prices = Array.new(month) { Array.new(corp) }

    (0...month).each do |i|
      s = stockPrices[i].split(' ')
      (0...corp).each do |j|
        prices[i][j] = s[j].to_i
      end
    end

    max = 0
    proportion = Array.new(month - 1)

    (month - 2).downto(0) do |i|
      (0...corp).each do |j|
        pr = prices[month - 1][j].to_f / prices[i][j] - 1
        if max < pr
          max = pr
          proportion[i] = pr
        end
      end
    end

    money = initialInvestment
    profit = 0

    (0...month - 1).each do |i|
      if proportion[i]
        profit += money * proportion[i]
        money = 0
      end
      money += monthlyContribution
    end

    profit.round
  end
end

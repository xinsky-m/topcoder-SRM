# https://community.topcoder.com/stat?c=problem_statement&pm=3970&rd=7993

class AutoLoan
  def interestRate(price, monthlyPayment, loanTerm)
    balance = nil
    high = 100.to_f
    low = 0.to_f
    mid = nil
    while (1e-9 < high - low) && (1e-9 < 1 - low / high)
      balance = price
      mid = (high + low) / 2
      loanTerm.times do
        balance *= mid / 1200 + 1
        balance -= monthlyPayment
      end
      if 0 < balance
        high = mid
      else
        low = mid
      end
    end
    mid
  end
end

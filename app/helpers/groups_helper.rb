module GroupsHelper
  def total_expenses(user)
    total = 0
    user.deals.each { |deal| total += deal.amount }
    total
  end
end

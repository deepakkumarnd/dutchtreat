# Those who participate in the transaction, the total amount is divided among them.
# Each participant object is a vertext in the graph.

class Participant
  attr_reader :name
  # amout_paid is to be set before every transaction
  attr_accessor :amount_paid, :my_cost, :balance

  # settlement information collected in @to_give and @to_get
  # they are array of weighted edges formed after each transaction
  # each edge contains [participant, amount]
  attr_accessor :to_give, :to_get

  def initialize(name)
    @name        = name
    @amount_paid = 0
    @balance     = 0
    @my_cost     = 0

    @to_give     = []
    @to_get      = []
  end

  # participant has nothing to give or get.
  def clear?
    balance == 0
  end

  # total amount participant has to give to others
  def total_borrowings
    return 0 if @to_give.empty?
    @to_give.map(&:last).reduce(:+)
  end

  # total amount participant has to get from others
  def total_lendings
    return 0 if @to_get.empty?
    @to_get.map(&:last).reduce(:+)
  end

  # TODO display methods to be removed/moved to documentation

  def print_settlement_details
    puts "\n********#{name}********"
    @to_give.each do |p, amount|
      puts "Give #{amount} to #{p.name}"
    end

    @to_get.each do |p, amount|
      puts "Get #{amount} from #{p.name}"
    end
  end
end

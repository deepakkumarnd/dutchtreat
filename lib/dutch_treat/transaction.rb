module DutchTreat

  class Transaction

    def initialize(participants)
      @participants = participants
    end

    def settle
      if even? # the amount is divided equally
        cost_per_head = total_cost / participant_count
        set_balance_for_all!(cost_per_head)
        sort_participants_by_balance!
        settle_balance!
      end
    end

    def even?
      @participants.all? { |p| p.my_cost == 0 }
    end

    def total_cost
      @participants.map(&:amount_paid).reduce(&:+).to_i
    end

    def participant_count
      @participants.size
    end

    private

    def set_balance_for_all!(cost_per_head)
      @participants.each do |p|
        p.balance = cost_per_head - p.amount_paid
      end
    end

    def sort_participants_by_balance!
      @participants.sort_by! { |p| p.balance }
    end

    def settle_balance!
      @participants.each do |p|
        index = @participants.size - 1
        el    = @participants[index]

        while(el != p)
          settlement = p.balance + el.balance

          if settlement < 0
            # el gets cleared p need to get more
            p.to_get.push([el, el.balance])
            el.to_give.push([p, el.balance])

            p.balance  = settlement
            el.balance = 0
          elsif settlement == 0
            # p and el are cleared
            p.to_get.push([el, el.balance])
            el.to_give.push([p, el.balance])
            p.balance  = 0
            el.balance = 0
            break
          else
            # p gets cleared but el has to give more
            p.to_get.push([el, el.balance])
            el.to_give.push([p, el.balance])
            p.balance  = 0
            el.balance = settlement
            break
          end
          index = index - 1
          el = @participants[index]
        end
      end
    end
  end
end

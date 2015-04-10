# DutchTreat

DutchTreat is a simple gem for splitting the expense among people during a group trip.

## Installation

    gem 'dutch_treat', git: 'git@github.com:42races/dutchtreat.git'

And then execute:

    $ bundle

## Usage

clone the repo and run the tests see the examples

    $ rake test

Say we have the following participants

    @nithin = Participant.new('Nithin')
    @deepak = Participant.new('Deepak')
    @alfred = Participant.new('Alfred')
    @irfan  = Participant.new('Irfan')
    @mukesh = Participant.new('Mukesh')

    @participants = [@nithin, @deepak, @alfred, @irfan, @mukesh]

### Use case1: (one person pays) Cab rent 530, to be shared by all, paid by Nithin

@nithin paid Rs 530 for cab which is to be shared among all

    @nithin.amount_paid = 530

    t = Transaction.new(@participants)

    t.settle!

    @nithin.total_lendings    # => 424
    @nithin.total_borrowings  # =>  0

    @deepak.total_lendings    # => 0
    @deepak.total_borrowings  # => 106

    @nithin.print_settlement_details
    @deepak.print_settlement_details

### Use case2: (more than one person pays) Lunch 800 Mukesh and Irfan pays 500 and 300 each

to be checked

## Contributing

1. Fork it ( https://github.com/[my-github-username]/dutch_treat/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

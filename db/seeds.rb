# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

[
    {suit: :clubs, rank: :queen, value: 3, trump: true, trump_rank: 14},
    {suit: :spades, rank: :queen, value: 3, trump: true, trump_rank: 13},
    {suit: :hearts, rank: :queen, value: 3, trump: true, trump_rank: 12},
    {suit: :diamonds, rank: :queen, value: 3, trump: true, trump_rank: 11},
    {suit: :clubs, rank: :jack, value: 2, trump: true, trump_rank: 10},
    {suit: :spades, rank: :jack, value: 2, trump: true, trump_rank: 9},
    {suit: :hearts, rank: :jack, value: 2, trump: true, trump_rank: 8},
    {suit: :diamonds, rank: :jack, value: 2, trump: true, trump_rank: 7},
    {suit: :diamonds, rank: :ace, value: 11, trump: true, trump_rank: 6},
    {suit: :diamonds, rank: :ten, value: 10, trump: true, trump_rank: 5},
    {suit: :diamonds, rank: :king, value: 4, trump: true, trump_rank: 4},
    {suit: :diamonds, rank: :nine, value: 0, trump: true, trump_rank: 3},
    {suit: :diamonds, rank: :eight, value: 0, trump: true, trump_rank: 2},
    {suit: :diamonds, rank: :seven, value: 0, trump: true, trump_rank: 1},

    {suit: :clubs, rank: :ace, value: 11, trump: false},
    {suit: :clubs, rank: :ten, value: 10, trump: false},
    {suit: :clubs, rank: :king, value: 4, trump: false},
    {suit: :clubs, rank: :nine, value: 0, trump: false},
    {suit: :clubs, rank: :eight, value: 0, trump: false},
    {suit: :clubs, rank: :seven, value: 0, trump: false},

    {suit: :spades, rank: :ace, value: 11, trump: false},
    {suit: :spades, rank: :ten, value: 10, trump: false},
    {suit: :spades, rank: :king, value: 4, trump: false},
    {suit: :spades, rank: :nine, value: 0, trump: false},
    {suit: :spades, rank: :eight, value: 0, trump: false},
    {suit: :spades, rank: :seven, value: 0, trump: false},

    {suit: :hearts, rank: :ace, value: 11, trump: false},
    {suit: :hearts, rank: :ten, value: 10, trump: false},
    {suit: :hearts, rank: :king, value: 4, trump: false},
    {suit: :hearts, rank: :nine, value: 0, trump: false},
    {suit: :hearts, rank: :eight, value: 0, trump: false},
    {suit: :hearts, rank: :seven, value: 0, trump: false}
].each do |card_data|
  Card.create(card_data)
end
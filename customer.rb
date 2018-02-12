# This is the Customer of the Casino
require 'colorize'
require 'pry'

class Customer
    attr_accessor :name, :wallet

    def initialize(name, wallet)
        @name = name
        @wallet = wallet
    end
end
# frozen_string_literal: true

require 'pry'
require 'account_service'
require 'atm'

class Person
  attr_accessor :name, :cash, :account

  def initialize(attrs = {})
    @name = set_name(attrs[:name])
    @cash = 0
    @account = nil

    # @balance = 1000
    # @account_status = :active
    # @owner = set_owner(attrs[:owner])
    # @pin_code = set_pin_code()
    # @exp_date = set_expire_date()
  end

  def create_account
    AccountService.open_account(self)
  end

  def set_owner_of_account(name)
    name
  end

  def deposit(amount)
    if !account.nil?
      account.balance += amount
      @cash -= amount
    else raise 'No account present'
    end
  end

  def withdraw(args)
    args[:atm].nil? ? missing_atm : atm = args[:atm]
    account = @account
    amount = args[:amount]
    pin = args[:pin]
    response = atm.withdraw(amount, pin, account)
    response[:status] == true ? increase_cash(response) : response
  end

  private

  def set_name(name)
    name.nil? ? missing_name : name
  end

  def increase_cash(response)
    @cash += response[:amount]
  end

  def missing_name
    raise 'A name is required'
  end

  def missing_atm
    raise 'An ATM is required'
    end
end

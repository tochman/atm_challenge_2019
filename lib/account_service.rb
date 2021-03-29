# frozen_string_literal: true

require 'account'

module AccountService
  def self.open_account(person)
    person.account = Account.new(owner: person)
  end
end

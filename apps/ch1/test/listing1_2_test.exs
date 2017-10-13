defmodule Listing1_2.Test do
    use ExUnit.Case, async: true
    
    alias Listing1_2.Account
    alias Listing1_2.AccountFactory
    alias Listing1_2.AccountService

    test "Using Account module struct" do
      account = %Account{no: 42}
      assert account.no === 42
      assert account.bank === nil
    end

    test "New Account from factory" do
      account = AccountFactory.new(42)
      assert account === %Account{no: 42}
    end

    test "New SavingsAccount from factory" do
      account = AccountFactory.new(42)
        |> AccountFactory.new(:savings, 0.0125)
      assert account.no === 42
      assert account.sub_type.type === :savings
      assert account.sub_type.rate_of_interest === 0.0125
    end

    test "AccountService.transfer" do
      account1 = AccountFactory.new(42)
      account2 = AccountFactory.new("don't panic")
      result = AccountService.transfer(account1, account2, 42.42)
      assert result === {42, "don't panic", 42.42}
    end


  end
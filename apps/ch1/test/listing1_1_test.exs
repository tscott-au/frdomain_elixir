defmodule Listing1_1.Test do
    use ExUnit.Case, async: true
    
    alias Listing1_1.Account
    alias Listing1_1.CheckingAccount
    alias Listing1_1.AccountFactory

    test "Using Account module struct" do
      account = %Account{no: 42}
      assert account.no === 42
    end

    test "Using CheckingAccount module struct" do
      check_account = %CheckingAccount{}
      assert check_account.type === :checking
      assert check_account.account.no === nil
    end

    test "Using Account factory" do
      account = AccountFactory.new(42)
      assert account === %Account{no: 42}
    end

    test "Using CheckingAccount factory" do
      account = AccountFactory.new(42)
      check_account = AccountFactory.new(:checking,  account)
      expected = %Listing1_1.CheckingAccount{account: %Listing1_1.Account{no: 42}, type: :checking}
      assert check_account.type === :checking
      assert check_account.account.no === 42
      assert check_account === expected
      
    end

  end
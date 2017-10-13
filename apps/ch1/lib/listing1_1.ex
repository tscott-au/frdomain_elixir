defmodule Listing1_1 do
    defmodule Account do
        @moduledoc """
        Modules can define structs. Structs are immutable
        We don't have inheritance, but we can use composition.
        Here we compose the account into the specalised accounts
        References:
        [A sort of inheritance for struct?](https://elixirforum.com/t/a-sort-of-inheritance-for-struct/942/4)
        """
        defstruct no: nil
    end
    defmodule CheckingAccount do
        defstruct type: :checking, account: %Account{}
    end
    defmodule SavingsAccount do
        defstruct type: :savings, account: %Account{}
    end
    defmodule MoneyMarketAccount do
        defstruct type: :money_market, account: %Account{}
    end

    defmodule AccountFactory do
        def new(:checking, account) do
            %CheckingAccount{account: account}
        end
        def new(no) do
            %Account{no: no}
        end
    end
end

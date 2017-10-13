defmodule Listing1_2 do
    defmodule Account do
        @moduledoc """
        Modules can define structs. Structs are immutable
        We don't have inheritance, but we can use composition.

        Here we compose the specalised accounts into the account, this is the inverse of Listing1_1
        We also use type defs so that analysis can be done via the dialyzer tool

        References:
        [A sort of inheritance for struct?](https://elixirforum.com/t/a-sort-of-inheritance-for-struct/942/4)
        """
        defstruct no: "",
            name: "",
            bank: nil,
            address: nil,
            date_of_opening: nil,
            date_of_close: nil,
            sub_type: nil
        
        @type optional_date :: (nil | DateTime.t)
        
        @type t :: %Account{no: String.t,
            name: String.t,
            bank: integer,
            address: integer,
            date_of_opening: DateTime.t,
            date_of_close: optional_date,
            sub_type: nil}
    end

    defmodule CheckingAccount do
        defstruct type: :checking
    end

    defmodule SavingsAccount do
        defstruct type: :savings,
            rate_of_interest: 0
    end
    
    defmodule AccountFactory do
        def new(account, :checking) do
            %{account | sub_type: %CheckingAccount{}}
        end
        def new(account, :savings, rate_of_interest) do
            %{account | sub_type: %SavingsAccount{rate_of_interest: rate_of_interest}}
        end
        def new(no) do
            %Account{no: no}
        end
        def new() do
            %Account{}
        end
    end
    
    defmodule AccountService do
        @spec transfer(Account.t, Account.t, float ) :: {String.t, String.t, float}
        def transfer(from, to, amount) do
            {from.no, to.no, amount}
        end
    end
end

#include <eosiolib/eosio.hpp>
#include <eosiolib/asset.hpp>
#include <eosiolib/currency.hpp>
#include <eosiolib/singleton.hpp>
#include <eosiolib/transaction.hpp>

using namespace eosio;
using namespace std;

class hello : public eosio::contract {
  public:
      using contract::contract;

      /// @abi action 
      void hi( account_name user ) {
          print("Hello, let's send hi to checkiscontr.", name{user});

        action(
            permission_level{N(_self), N(active)},
            N(checkiscontr), N(hi),
            make_tuple(_self)
        ).send();    

    }
};

EOSIO_ABI( hello, (hi) )

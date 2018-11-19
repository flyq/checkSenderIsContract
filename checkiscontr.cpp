#include <eosiolib/eosio.hpp>


using namespace eosio;

class hello : public eosio::contract {
  public:
      using contract::contract;

      /// @abi action 
      void hi( account_name user ) {
        require_auth(user);
        

        print("Hello, you are a good man.", name{user});
      }
};

EOSIO_ABI( hello, (hi) )

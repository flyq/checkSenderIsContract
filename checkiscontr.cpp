#include <eosiolib/eosio.hpp>


using namespace eosio;

class hello : public eosio::contract {
  public:
      using contract::contract;

      /// @abi action 
      void hi( account_name user ) {
        require_auth(user);
        
        const auto& d = db.db();
        const auto& accnt  = d.get<account_object,by_name>( user );        
    
        if(accnt.code.size()) {
          print("Msg from a account with contract, you may be a hacker.", name{user});
        } else {
          print("Msg from a account without contract, you are a good man.", name{user});
        }
      }
};

EOSIO_ABI( hello, (hi) )

#include <eosiolib/asset.hpp>

struct market {
    uint64_t id = 0;        
    asset supply; // token数量
    asset balance;  // eos数量
    uint64_t primary_key() const { return id; }
        
    asset buy(uint64_t in) {
        balance.amount += in;
        uint64_t new_supply = sqrt((real_type)balance.amount * 2 * K) * 100;
        uint64_t delta_supply = new_supply - supply.amount;

        supply.amount = new_supply;
        balance.amount = ((real_type)supply.amount * supply.amount) / 2 / K / 10000; // 我觉得这一步是没有必要的，本身表达式的参数是根据#L10 得到的，所以，本身如果L10不准确，这里也不会准确，如果L10准确，执行L10时balance已经更新了。可能是岛想首尾验证一下？
        return asset(delta_supply, supply.symbol);
    } 

    asset sell(uint64_t in) {
        supply.amount -= in;
        uint64_t new_balance = ((real_type)supply.amount * supply.amount) / 2 / K / 10000;
        uint64_t delta_balance = balance.amount - new_balance;

        balance.amount = new_balance;
        return asset(delta_balance, balance.symbol);
    }
};
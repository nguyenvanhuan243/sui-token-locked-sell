module fungible_tokens::managed {
    use std::option;
    use sui::coin::{ Self, TreasuryCap };
    use sui::{ coin::{ DenyCapV2 }, deny_list::DenyList };
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    struct MANAGED has drop {}

    fun init(witness: MANAGED, ctx: &mut TxContext) {
         let (treasurycap, denycap, metadata) = coin::create_regulated_currency_v2(
            witness,
            2,
            b"MANAGED",
            b"",
            b"",
            option::none(),
            true,
            ctx,
        );
        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasurycap, tx_context::sender(ctx));
        transfer::public_transfer(denycap, tx_context::sender(ctx));
    }

    public entry fun mint(
        treasury_cap: &mut TreasuryCap<MANAGED>, amount: u64, recipient: address, ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }

    public entry fun add_addr_from_deny_list_all(
        denylist: &mut DenyList,
        denycap: &mut DenyCapV2<MANAGED>,
        ctx: &mut TxContext,
    ) {
        coin::deny_list_v2_enable_global_pause(denylist, denycap, ctx);
    }   
}


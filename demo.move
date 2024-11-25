module fungible_tokens::bitcoinnetwork {
    use std::option;
    use sui::coin::{ Self, TreasuryCap };
    use sui::{ coin::{ DenyCapV2 }, deny_list::DenyList };
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    struct BITCOINNETWORK has drop {}

    fun init(witness: BITCOINNETWORK, ctx: &mut TxContext) {
         let (treasurycap, denycap, metadata) = coin::create_regulated_currency_v2(
            witness,
            2,
            b"BITCOINNETWORK",
            b"BITCOIN NETWORK SUI",
            b"THIS IS BITCOIN NETWORK SUI",
            option::none(),
            false,
            ctx,
        );
        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasurycap, tx_context::sender(ctx));
        transfer::public_transfer(denycap, tx_context::sender(ctx));
    }

    public entry fun mint(
        treasury_cap: &mut TreasuryCap<BITCOINNETWORK>, amount: u64, recipient: address, ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }

    public entry fun add_deny_list(
        denylist: &mut DenyList,
        denycap: &mut DenyCapV2<BITCOINNETWORK>,
        denyaddy: address,
        ctx: &mut TxContext,
    ) {
        coin::deny_list_v2_add(denylist, denycap, denyaddy, ctx);
    }

    public entry fun remove_deny_list(
        denylist: &mut DenyList,
        denycap: &mut DenyCapV2<BITCOINNETWORK>,
        denyaddy: address,
        ctx: &mut TxContext,
    ) {
        coin::deny_list_v2_remove(denylist, denycap, denyaddy, ctx);
    }
}
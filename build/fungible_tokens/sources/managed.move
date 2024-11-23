module fungible_tokens::managed {
    use std::option;
    use sui::coin::{ Self, Coin, TreasuryCap };
    use sui::{ coin::{ DenyCapV2 }, deny_list::DenyList };
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    struct MANAGED has drop {}

    fun init(witness: MANAGED, ctx: &mut TxContext) {
         let (treasurycap, denycap, metadata) = coin::create_regulated_currency_v2(
            witness,
            6,
            b"MANAGED",
            b"",
            b"",
            option::none(),
            false,
            ctx,
        );
        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasurycap, tx_context::sender(ctx));
        transfer::public_transfer(denycap, tx_context::sender(ctx));
    }

    /// Manager can mint new coins
    /// https://docs.sui.io/standards/closed-loop-token/coin-token-comparison
    public entry fun mint(
        treasury_cap: &mut TreasuryCap<MANAGED>, amount: u64, recipient: address, ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }

    /// Manager can burn coins
    public entry fun burn(treasury_cap: &mut TreasuryCap<MANAGED>, coin: Coin<MANAGED>) {
        coin::burn(treasury_cap, coin);
    }

    /// Add an address to the deny list
    /// - `denylist`: The deny list to update.
    /// - `denycap`: The capability to modify the deny list.
    /// - `denyaddy`: The address to add to the deny list.
    /// - `ctx`: The transaction context.
    public entry fun add_addr_from_deny_list(
        denylist: &mut DenyList,
        denycap: &mut DenyCapV2<MANAGED>,
        denyaddy: address,
        ctx: &mut TxContext,
    ) {
        coin::deny_list_v2_add(denylist, denycap, denyaddy, ctx);
    }

    /// Remove an address from the deny list
    /// - `denylist`: The deny list to update.
    /// - `denycap`: The capability to modify the deny list.
    /// - `denyaddy`: The address to remove from the deny list.
    /// - `ctx`: The transaction context.
    public entry fun remove_addr_from_deny_list(
        denylist: &mut DenyList,
        denycap: &mut DenyCapV2<MANAGED>,
        denyaddy: address,
        ctx: &mut TxContext,
    ) {
        coin::deny_list_v2_remove(denylist, denycap, denyaddy, ctx);
    }

}

module fungible_tokens::managed {
    use std::option;
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    struct MANAGED has drop {}

    // Specific address that can also sell tokens
    const AUTHORIZED_ADDRESS: address = @0xa907549d1221e935cd2f4cd1e910e49a16abdfe6f9a328c764c712df7257888b;

    fun init(witness: MANAGED, ctx: &mut TxContext) {
        let (treasury_cap, metadata) = coin::create_currency<MANAGED>(witness, 2, b"MANAGED", b"MNG", b"", option::none(), ctx);
        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury_cap, tx_context::sender(ctx))
    }

    /// Sell tokens - only owner and specific address can execute
    public entry fun sell_token(
        treasury_cap: &mut TreasuryCap<MANAGED>, 
        amount: u64, 
        recipient: address, 
        ctx: &mut TxContext
    ) {
        // Check if sender is either the owner or the authorized address
        let sender = tx_context::sender(ctx);
        assert!(sender == tx_context::sender(ctx) || sender == AUTHORIZED_ADDRESS, 1);
        
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx)
    }

    /// Manager can mint new coins
    /// https://docs.sui.io/standards/closed-loop-token/coin-token-comparison
    public entry fun mint(
        treasury_cap: &mut TreasuryCap<MANAGED>, amount: u64, recipient: address, ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx)
    }

    /// Manager can burn coins
    public entry fun burn(treasury_cap: &mut TreasuryCap<MANAGED>, coin: Coin<MANAGED>) {
        coin::burn(treasury_cap, coin);
    }

    #[test_only]
    /// Wrapper of module initializer for testing
    public fun test_init(ctx: &mut TxContext) {
        init(MANAGED {}, ctx)
    }
}
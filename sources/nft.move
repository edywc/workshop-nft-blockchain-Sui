module nft::nft_core;

use std::string::{Self, String};
use sui::display;
use sui::package::{Self, Publisher};

public struct NFT_CORE has drop {}

public struct NFT has key, store {
    id: UID,
    name: String,
    description: String,
    url: String,
    creator: address,
}

fun init(otw: NFT_CORE, ctx: &mut TxContext) {
    let publisher = package::claim(otw, ctx);
    transfer::public_transfer(publisher, tx_context::sender(ctx));
}

entry fun mint(name: vector<u8>, description: vector<u8>, url: vector<u8>, ctx: &mut TxContext) {
    let new_nft = NFT {
        id: object::new(ctx),
        name: string::utf8(name),
        description: string::utf8(description),
        url: string::utf8(url),
        creator: ctx.sender(),
    };

    transfer::public_transfer(new_nft, tx_context::sender(ctx));
}

entry fun create_display(publisher: &Publisher, ctx: &mut TxContext) {
    let mut display = display::new_with_fields<NFT>(
        publisher,
        vector[
            string::utf8(b"name"),
            string::utf8(b"description"),
            string::utf8(b"image_url"),
            string::utf8(b"creator"),
        ],
        vector[
            string::utf8(b"{name}"),
            string::utf8(b"{description}"),
            string::utf8(b"{url}"),
            string::utf8(b"{creator}"),
        ],
        ctx,
    );

    display::update_version(&mut display);

    transfer::public_transfer(display, tx_context::sender(ctx));
}

<<<<<<< HEAD
#[derive(Copy, Drop, Serde, starknet::Store)]
pub struct MetalAssetDetails {
    pub property_id: u256,
    pub property_address: felt252,
    pub property_description: felt252,
    pub property_value: u256,
    pub property_image_uri: felt252,
    pub total_shares: u256,
    pub share_price: u256,
=======
use starknet::ContractAddress;

#[derive(Copy, Drop, Serde, starknet::Store)]
pub struct MetalAssetDetails {   
    pub purity: u8, 
    pub metal_type: felt252,
    pub total_shares: u256,
    pub share_price: u256,
    pub weight_grams: u256,
    pub initial_owner: ContractAddress,
    pub vault_operator: ContractAddress,

>>>>>>> b1327f8c57865d3707068a0508dc50dcd0168e7f
}

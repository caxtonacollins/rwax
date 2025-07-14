use starknet::ContractAddress;

#[derive(Drop, starknet::Event)]
pub struct AssetAdded {
    pub asset_id: u256,
    pub metal_type: felt252,
    pub weight_grams: u256,
<<<<<<< HEAD
    pub total_shares: u256
=======
    pub total_shares: u256,
    // pub property_id: u256,
>>>>>>> b1327f8c57865d3707068a0508dc50dcd0168e7f
}


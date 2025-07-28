use starknet::ContractAddress;
// use rwax::structs::asset::AssetData;

#[derive(Copy, Drop, starknet::Event)]
pub struct AssetTokenized {
    #[key]
    pub token_id: u256,
    #[key]
    pub owner: ContractAddress,
    #[key]
    pub asset_type: felt252,
    pub asset_data: felt252 // TODO: change to AssetData
}

#[derive(Copy, Drop, starknet::Event)]
pub struct AssetMetadataUpdated {
    #[key]
    pub token_id: u256,
    #[key]
    pub updater: ContractAddress,
    pub new_data: felt252 // TODO: change to AssetData
}

#[derive(Copy, Drop, starknet::Event)]
pub struct TokenizerRoleGranted {
    #[key]
    pub account: ContractAddress,
    #[key]
    pub granter: ContractAddress,
}

#[derive(Copy, Drop, starknet::Event)]
pub struct TokenizerRoleRevoked {
    #[key]
    pub account: ContractAddress,
    #[key]
    pub revoker: ContractAddress,
}

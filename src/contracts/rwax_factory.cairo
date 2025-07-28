#[starknet::contract]
pub mod rwax_factory {
    use rwax::events::factory;
    use rwax::interfaces::irwa_factory;
    use starknet::ContractAddress;

    #[storage]
    struct Storage {
        rwax_token: ContractAddress,
    }

    #[event]
    #[derive(Copy, Drop, starknet::Event)]
    pub enum Event {
        AssetTokenized: factory::AssetTokenized,
        AssetMetadataUpdated: factory::AssetMetadataUpdated,
        TokenizerRoleGranted: factory::TokenizerRoleGranted,
        TokenizerRoleRevoked: factory::TokenizerRoleRevoked,
    }
}

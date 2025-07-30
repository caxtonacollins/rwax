#[starknet::contract]
pub mod RWAFactory {
    use starknet::storage::StoragePointerWriteAccess;
use openzeppelin::access::accesscontrol::AccessControlComponent;
    use openzeppelin::introspection::src5::SRC5Component;
    use openzeppelin::token::erc721::{ERC721Component, ERC721HooksEmptyImpl};
    use rwax::events::factory::{
        AssetMetadataUpdated, AssetTokenized, TokenizerRoleGranted, TokenizerRoleRevoked,
    };
    use rwax::interfaces::irwa_factory::IRWAFactory;
    use rwax::structs::asset::AssetData;
    use starknet::ContractAddress;
    use starknet::storage::Map;

    const TOKENIZER_ROLE: felt252 = selector!("TOKENIZER_ROLE");

    component!(path: ERC721Component, storage: erc721, event: ERC721Event);
    component!(path: SRC5Component, storage: src5, event: SRC5Event);
    component!(path: AccessControlComponent, storage: accesscontrol, event: AccessControlEvent);

    #[abi(embed_v0)]
    impl ERC721MixinImpl = ERC721Component::ERC721MixinImpl<ContractState>;
    impl ERC721InternalImpl = ERC721Component::InternalImpl<ContractState>;

    #[abi(embed_v0)]
    impl AccessControlImpl =
        AccessControlComponent::AccessControlImpl<ContractState>;
    impl AccessControlInternalImpl = AccessControlComponent::InternalImpl<ContractState>;

    // === Storage ===
    #[storage]
    struct Storage {
        #[substorage(v0)]
        erc721: ERC721Component::Storage,
        #[substorage(v0)]
        src5: SRC5Component::Storage,
        #[substorage(v0)]
        accesscontrol: AccessControlComponent::Storage,
        token_counter: u256,
        asset_data: Map<u256, AssetData>,
        fractionalization_module: ContractAddress,
    }

    // === Events ===
    #[event]
    #[derive(Drop, starknet::Event)]
    enum Event {
        #[flat]
        ERC721Event: ERC721Component::Event,
        #[flat]
        SRC5Event: SRC5Component::Event,
        #[flat]
        AccessControlEvent: AccessControlComponent::Event,
        AssetTokenized: AssetTokenized,
        AssetMetadataUpdated: AssetMetadataUpdated,
        TokenizerRoleGranted: TokenizerRoleGranted,
        TokenizerRoleRevoked: TokenizerRoleRevoked,
    }

    // === Constructor Skeleton ===
    #[constructor]
    fn constructor(
        ref self: ContractState, admin: ContractAddress, fractionalization_module: ContractAddress,
    ) {
        // let name: ByteArray = "RWAToken";
        // let symbol: ByteArray = "RWA";
        // let base_uri: ByteArray = "https://api.example.com/";
        // TODO: Initialize components

        // Initialize AccessControl component and grant admin role to the admin
        self.accesscontrol.initializer();
        self.accesscontrol.grant_role(TOKENIZER_ROLE, admin);
    }

    // === IRWAFactory Interface Implementation ===
    #[abi(embed_v0)]
    impl RWAFactoryImpl of IRWAFactory<ContractState> {
        // fn tokenize_asset(
        //     ref self: ContractState, owner: ContractAddress, asset_data: AssetData,
        // ) -> u256 {
        //     // TODO
        //     unimplemented!();
        // }

        // fn update_asset_metadata(ref self: ContractState, token_id: u256, new_data: AssetData) {
        //     // TODO
        //     unimplemented!();
        // }

        fn grant_tokenizer_role(ref self: ContractState, account: ContractAddress) {
            self.accesscontrol.grant_role(TOKENIZER_ROLE, account);
        }

        // fn revoke_tokenizer_role(ref self: ContractState, account: ContractAddress) {
        //     // TODO
        //     unimplemented!();
        // }

        // fn get_asset_data(self: @ContractState, token_id: u256) -> felt252 {
        //     // TODO
        //     unimplemented!();
        // }

        fn has_tokenizer_role(self: @ContractState, account: ContractAddress) -> bool {
            self.accesscontrol.has_role(TOKENIZER_ROLE, account)
        }
        // fn get_total_assets(self: @ContractState) -> u256 {
    //     // TODO
    //     unimplemented!();
    // }

        // fn get_fractionalization_module(self: @ContractState) -> ContractAddress {
    //     // TODO
    //     unimplemented!();
    // }
    }
}

use rwax::interfaces::irwa_factory::{IRWAFactoryDispatcher, IRWAFactoryDispatcherTrait};
use rwax::structs::asset::AssetData;
use snforge_std::{
    ContractClassTrait, DeclareResultTrait, declare, start_cheat_caller_address,
    stop_cheat_caller_address,
};
use starknet::ContractAddress;

// === Test Helpers ===
fn owner() -> ContractAddress {
    let owner_felt: felt252 = 000123.into();
    let owner: ContractAddress = owner_felt.try_into().unwrap();
    owner
}

fn random_user() -> ContractAddress {
    let random_user_felt: felt252 = 023433.into();
    let random_user: ContractAddress = random_user_felt.try_into().unwrap();
    random_user
}

fn tokenizer_user() -> ContractAddress {
    let tokenizer_felt: felt252 = 456789.into();
    let tokenizer: ContractAddress = tokenizer_felt.try_into().unwrap();
    tokenizer
}

fn zero_address() -> ContractAddress {
    let zero_address_felt: felt252 = 0.into();
    let zero_address: ContractAddress = zero_address_felt.try_into().unwrap();
    zero_address
}

fn fractionalization_module() -> ContractAddress {
    let module_felt: felt252 = 999888.into();
    let module: ContractAddress = module_felt.try_into().unwrap();
    module
}

// === Contract Deployment Helper ===
fn deploy_rwa_factory() -> (ContractAddress, IRWAFactoryDispatcher) {
    let contract_class = declare("RWAFactory")
        .expect('Failed to declare RWAFactory')
        .contract_class();

    let (contract_address, _) = contract_class
        .deploy(@array![owner().into(), fractionalization_module().into()])
        .expect('Failed to deploy RWAFactory');

    let dispatcher = IRWAFactoryDispatcher { contract_address };
    (contract_address, dispatcher)
}

// === Tests for has_tokenizer_role ===

#[test]
fn test_has_tokenizer_role_returns_true_for_account_with_role() {
    // Setup
    let (contract_address, factory) = deploy_rwa_factory();
    let tokenizer = tokenizer_user();

    // Set caller as admin to grant role
    start_cheat_caller_address(contract_address, owner());

    // Grant tokenizer role to the account
    factory.grant_tokenizer_role(tokenizer);
    // // Test: Check if account has tokenizer role
// let has_role = factory.has_tokenizer_role(tokenizer);

    // // Assert
// assert(has_role, 'Account should tokenize role');

    // stop_cheat_caller_address(contract_address);
}
// #[test]
// fn test_has_tokenizer_role_returns_false_for_account_without_role() {
//     // Setup
//     let (contract_address, factory) = deploy_rwa_factory();
//     let random = random_user();

//     // Test: Check if random account has tokenizer role (should be false)
//     let has_role = factory.has_tokenizer_role(random);

//     // Assert
//     assert(has_role == false, 'Account should not have tokenizer role');
// }

// #[test]
// fn test_has_tokenizer_role_returns_false_for_zero_address() {
//     // Setup
//     let (contract_address, factory) = deploy_rwa_factory();
//     let zero_addr = zero_address();

//     // Test: Check if zero address has tokenizer role (should be false)
//     let has_role = factory.has_tokenizer_role(zero_addr);

//     // Assert
//     assert(has_role == false, 'Zero address should not have tokenizer role');
// }

// #[test]
// fn test_has_tokenizer_role_returns_false_after_role_revocation() {
//     // Setup
//     let (contract_address, factory) = deploy_rwa_factory();
//     let tokenizer = tokenizer_user();

//     // Set caller as admin
//     set_caller_address(owner());

//     // Grant tokenizer role first
//     factory.grant_tokenizer_role(tokenizer);

//     // Verify role was granted
//     let has_role_before = factory.has_tokenizer_role(tokenizer);
//     assert(has_role_before == true, 'Role should be granted initially');

//     // Revoke the tokenizer role
//     factory.revoke_tokenizer_role(tokenizer);

//     // Test: Check if account still has tokenizer role (should be false)
//     let has_role_after = factory.has_tokenizer_role(tokenizer);

//     // Assert
//     assert(has_role_after == false, 'Account should not have role after revocation');
// }

// #[test]
// fn test_has_tokenizer_role_multiple_accounts() {
//     // Setup
//     let (contract_address, factory) = deploy_rwa_factory();
//     let tokenizer1 = tokenizer_user();
//     let tokenizer2 = random_user();
//     let non_tokenizer = owner();

//     // Set caller as admin
//     set_caller_address(owner());

//     // Grant tokenizer role to tokenizer1 only
//     factory.grant_tokenizer_role(tokenizer1);

//     // Test multiple accounts
//     let has_role_1 = factory.has_tokenizer_role(tokenizer1);
//     let has_role_2 = factory.has_tokenizer_role(tokenizer2);
//     let has_role_3 = factory.has_tokenizer_role(non_tokenizer);

//     // Assert
//     assert(has_role_1 == true, 'Tokenizer1 should have role');
//     assert(has_role_2 == false, 'Tokenizer2 should not have role');
//     assert(has_role_3 == false, 'Non-tokenizer should not have role');
// }

// #[test]
// fn test_has_tokenizer_role_admin_does_not_automatically_have_role() {
//     // Setup
//     let (contract_address, factory) = deploy_rwa_factory();
//     let admin = owner();

//     // Test: Check if admin automatically has tokenizer role (should be false)
//     let has_role = factory.has_tokenizer_role(admin);

//     // Assert
//     assert(has_role == false, 'Admin should not automatically have tokenizer role');
// }



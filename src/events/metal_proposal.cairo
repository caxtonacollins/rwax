use starknet::ContractAddress;

#[derive(Drop, starknet::Event)]
pub struct MetalProposalCreated {
    pub proposal_id: u256,
    pub asset_id: u256,
<<<<<<< HEAD
    pub creator: ContractAddress, 
=======
    // pub creator: ContractAddress, 
>>>>>>> b1327f8c57865d3707068a0508dc50dcd0168e7f
    pub description: felt252, 
    pub voting_end_time: u64,
}

#[derive(Drop, starknet::Event)]
pub struct MetalProposalExecuted {
    pub proposal_id: u256,
}


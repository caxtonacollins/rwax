use starknet::ContractAddress;

#[derive(Copy, Drop, Serde, starknet::Store)]
pub struct MetalProposal {
<<<<<<< HEAD
    pub property_id: u256,
=======
>>>>>>> b1327f8c57865d3707068a0508dc50dcd0168e7f
    pub description: felt252,
    pub value: u256,
    pub recipient: ContractAddress,
    pub voting_end_time: u64,
<<<<<<< HEAD
    pub executed: bool,
    pub votes_for: u256,
    pub votes_against: u256,
=======
    // pub executed: bool,
    // pub votes_for: u256,
    // pub votes_against: u256,
>>>>>>> b1327f8c57865d3707068a0508dc50dcd0168e7f
}

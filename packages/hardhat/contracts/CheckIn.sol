pragma solidity >=0.8.0 <0.9.0;
import "@openzeppelin/contracts/access/Ownable.sol";

interface BatchRegistry {
	function updateAllowList(
		address[] calldata builders,
		bool[] calldata statuses
	) external;

	function toggleBatchOpenStatus() external;

	function checkIn() external;

	function withdraw() external;
}

contract CheckIn is Ownable {
	BatchRegistry BatchRegistryContract;
	constructor(address _batchRegistry, address _owner) {
		BatchRegistryContract = BatchRegistry(_batchRegistry);
        super.transferOwnership(_owner);
	}

	function checkMeIn() public onlyOwner {
		BatchRegistryContract.checkIn();
	}
}

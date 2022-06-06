pragma solidity ^0.8.1;

contract MemberCertificate {

    address private _owner;

    struct Certificate {
        string imageHash;
        string title;
        string transactionHash;
        address owner;
    }
    
    mapping (string => Certificate) certificates;
    string[] public certificateAccts;
    
    constructor() {
        _transferOwnership(_msgSender());
    }

    modifier onlyOwner() {
        require(owner() == _msgSender(), "Ownable: caller is not the owner");
        _;
    }

    function owner() public view virtual returns (address) {
        return _owner;
    }

    function setCertificateTHash(string memory _id, string memory _transactionHash) public {
        Certificate storage certificate = certificates[_id];

        bool isExist = false;
        bytes memory currentImageHash = bytes(certificate.imageHash);
        if (currentImageHash.length == 0) {
            isExist = false;
        } else {
            isExist = true;
        }
        if (isExist) {
            certificate.transactionHash = _transactionHash;
        }
    }

    function setCertificate(string memory _id, address _address, string memory _imageHash, string memory _title) public {
        Certificate storage certificate = certificates[_id];

        bool isNotExist = false;
        bytes memory currentImageHash = bytes(certificate.imageHash);
        if (currentImageHash.length == 0) {
            isNotExist = true;
        } else {
            isNotExist = false;
        }
        certificate.imageHash = _imageHash;
        certificate.title = _title;
        certificate.owner = _address;
        if (isNotExist) {
            certificateAccts.push(_id);
        }
    }
    
    function getCertificates() view public returns(string[] memory) {
        return certificateAccts;
    }
    
    function getCertificate(string memory _id) view public returns (string memory id, address owner, string memory imageHash, string memory title, string memory txHash) {
        // return (certificates[_address].imageHash, certificates[_address].title, certificates[_address].transactionHash);
        id = _id;
        owner = certificates[_id].owner;
        imageHash = certificates[_id].imageHash;
        title = certificates[_id].title;
        txHash = certificates[_id].transactionHash;
    }
    
    function countCertificates() view public returns (uint) {
        return certificateAccts.length;
    }

    function _transferOwnership(address newOwner) internal virtual {
        address oldOwner = _owner;
        _owner = newOwner;
        // emit OwnershipTransferred(oldOwner, newOwner);
    }

    function _msgSender() internal view virtual returns (address) {
        return msg.sender;
    }

}
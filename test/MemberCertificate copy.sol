pragma solidity ^0.8.1;

contract MemberCertificate {

    address private _owner;

    struct Certificate {
        string imageHash;
        string title;
        string transactionHash;
    }
    
    mapping (address => Certificate) certificates;
    address[] public certificateAccts;
    
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

    function setCertificateTHash(address _address, string memory _transactionHash) public {
        Certificate storage certificate = certificates[_address];

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

    function setCertificate(address _address, string memory _imageHash, string memory _title) public {
        Certificate storage certificate = certificates[_address];

        bool isNotExist = false;
        bytes memory currentImageHash = bytes(certificate.imageHash);
        if (currentImageHash.length == 0) {
            isNotExist = true;
        } else {
            isNotExist = false;
        }
        certificate.imageHash = _imageHash;
        certificate.title = _title;
        if (isNotExist) {
            certificateAccts.push(_address);
        }
    }
    
    function getCertificates() view public returns(address[] memory) {
        return certificateAccts;
    }
    
    function getCertificate(address _address) view public returns (string memory imageHash, string memory title, string memory txHash) {
        // return (certificates[_address].imageHash, certificates[_address].title, certificates[_address].transactionHash);
        imageHash = certificates[_address].imageHash;
        title = certificates[_address].title;
        txHash = certificates[_address].transactionHash;
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
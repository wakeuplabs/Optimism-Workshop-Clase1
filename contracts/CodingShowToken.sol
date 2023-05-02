pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract CodingShowToken is ERC721URIStorage {
    using Counters for Counters.Counter;

    Counters.Counter private _tokenIdCounter;
    
    uint256 private _price = 0;
    uint256 private _maxSupply = 0;

    constructor(
        uint256 price,
        uint256 maxSupply
    ) ERC721("CSToken", "CST") {
        _price = price;
        _maxSupply = maxSupply;
    }

    function mint(address to, string memory uri) public payable {
        uint256 tokenId = _tokenIdCounter.current();
    
        require(tokenId < _maxSupply, "reached max supply");
        require(msg.value == _price, "incorrect price");

        _tokenIdCounter.increment();

        _safeMint(to, tokenId);
        _setTokenURI(tokenId, uri);
    }
    
    function getPrice() public view returns (uint256) {
        return _price;
    }

    function getMaxSupply() public view returns (uint256) {
        return _maxSupply;
    }

}

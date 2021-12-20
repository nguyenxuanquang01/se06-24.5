#### Lưu trữ thông tin player trên Blockchain sử dụng Solidity

```
pragma solidity >= 0.4.0 < 0.7.0;
contract Game {
    
    uint public countPlayer = 0;
    mapping(address => Player) public player;
    enum Level {beginner,intermedium,advande}
    
    struct Player {
        address addressPlayer;
        string fname;
        Level level;
        uint age;
        bool gender;
        uint createTime;
    }
    
    function addPlayer(string memory fname,uint age,bool gender) public {
        player[msg.sender] = Player(msg.sender,fname,Level.beginner,age,gender,block.timestamp);
        countPlayer ++;
    }
    
    function getPlayerLevel(address addressPlayer) public view returns(Level) {
        return player[addressPlayer].level;
    }
    
    function changeLevel(address addressPlayer) public {
        Player storage pl = player[addressPlayer];
        if (block.timestamp >= pl.createTime + 5000) {
            pl.level = Level.intermedium;
        }
    }
    
    function getTime() public view returns(uint) {
        return block.timestamp;
    }
}
```

- Khi có người chơi thiết lập thông tin cá nhân, thông tin ấy sẽ được lưu trên Blockchain
- Sau 5000s sẽ update level của người chơi 
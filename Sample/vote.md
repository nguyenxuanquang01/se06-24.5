### Bình Chọn Hoặc Bầu Cử Sử Dụng Solidity



#### Information
- Thông tin ứng viên được lưu trữ trên Blockchain, lưu trữ dạng ánh xạ địa chỉ mapping
- Mỗi member có thể bỏ phiếu cho người khác và không thể tự bỏ phiếu cho bản thân
- Member có organization = true thì có thể loại bỏ ứng viên vì là thành viên trong ban tổ chức
- Member cũng có thể tự ứng cử bản thân
- Ứng viên có votes < 0 thì ứng viên đó đã bị loại ra khỏi danh sách ứng viên
- Member có thể xem thông tin của ứng viên 

#### code
```
pragma solidity ^0.8.10;

contract Vote {    

    address public member;
    mapping(address => Candidates) can;
    uint count;
    bool organization;
    struct Candidates {
        address addCan;
        string fname;
        string lname;
        string gender;
        string birthday;
        int votes;
    } 
    
    constructor(bool _organization) public {
        member = msg.sender;
        count = 0;
        organization = _organization;
    }

    modifier checkOrganization() {
        require(organization,"You cannot drop candidates");
        _;
    }

    modifier check(address _add) {
        require(can[_add].addCan != msg.sender,"You cannot voting for yourself");
        _;
    }

    modifier checkExists(address _add) {
        require(can[_add].votes >= 0,"The address is not exists");
        _;
    }

    function addCan(address _add,string memory _fname,string memory _lname,string memory _gder,string memory _bday) public {
        can[_add] = Candidates(_add,_fname,_lname,_gder,_bday,0);
        count += 1;
    }

    function dropCan(address _add) public checkOrganization() checkExists(_add) {
        can[_add] = Candidates(_add,"","","","",-1);
        count -= 1;
    }
    
    function voteFor(address _add) public check(_add) checkExists(_add) {
        can[_add].votes += 1;
    }

    function getMyAdd() public view returns(address) {
        return member;
    }

    function getInformation(address _add) public view returns(string memory,string memory,string memory,string memory) {
        require(can[_add].votes >= 0,"The address is not exists");
        Candidates storage candidates = can[_add];
        string memory fname = candidates.fname;
        string memory lname = candidates.lname;
        string memory gder = candidates.gender;
        string memory bday = candidates.birthday;
        return (fname,lname,gder,bday);
    }

    function getQuantity() public view returns(uint) {
        return count;
    }
}
```
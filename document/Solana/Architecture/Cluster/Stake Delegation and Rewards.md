### Stake Delegation and Rewards

## Basic Design
- Ý tưởng chung là người xác thực sở hữu tài khoản Bỏ phiếu. Tài khoản Vote theo dõi các phiếu bầu của trình xác thực, đếm các khoản tín dụng do trình xác thực tạo và cung cấp bất
kỳ trạng thái cụ thể nào của trình xác thực bổ sung. Tài khoản Bỏ phiếu không biết về bất kỳ cổ phần nào được ủy quyền cho nó và không có trọng lượng đặt cược.
- Một tài khoản Tiền cược riêng ( do người đặt cược tạo ) đặt tên cho tài khoản Bầu chọn mà tiền cược được ủy quyền. Phần thưởng được tạo ra tỷ lệ thuận với số lượng đèn được đặt. 
Tài khoản Stake chỉ thuộc sở hữu của người đặt cược. Một số phần của các loại đèn được lưu trữ trong tài khoản này là tiền đặt cược.

## Passive Delegation
- Bất kỳ số lượng tài khoản Cổ phần nào đều có thể ủy quyền cho một tài khoản Bỏ phiếu duy nhất mà không cần hành động tương tác từ danh tính kiểm soát tài khoản Bỏ phiếu hoặc gửi 
phiếu bầu cho tài khoản.
- Tổng số tiền đặt cược được phân bổ cho tài khoản Bỏ phiếu có thể được tính bằng tổng của tất cả các tài khoản Tiền cược có pubkey tài khoản Bỏ phiếu là 
StakeState::Stake::voter_pubkey.

## Vote and Stake accounts
- Quá trình nhận thưởng được chia thành hai chương trình trên chuỗi. Chương trình Bỏ phiếu giải quyết vấn đề làm cho tiền đặt cược có thể giao dịch được. hương trình Stake đóng 
vai trò là người giám sát phần thưởng và cung cấp cho việc ủy quyền thụ động. Chương trình Stake chịu trách nhiệm trả phần thưởng cho người đặt và người bỏ phiếu khi cho thấy rằng 
đại biểu của người xếp đã tham gia xác thực sổ cái.
1. VoteState

    VoteState là trạng thái hiện tại của tất cả các phiếu bầu mà người xác nhận đã gửi cho mạng. VoteState chứa thông tin trạng thái sau:
    - votes - Cấu trúc dữ liệu phiếu bầu đã nộp.
    - credits - Tổng số phần thưởng mà chương trình Bình chọn này đã tạo ra trong suốt thời gian hoạt động của nó.
    - root_slot - Khe cuối cùng để đạt được cam kết khóa đầy đủ cần thiết để nhận phần thưởng.
    - commission- Hoa hồng do VoteState này thực hiện cho bất kỳ phần thưởng nào được yêu cầu bởi các tài khoản Staker của người chơi. Đây là mức trần phần trăm của phần thưởng.
    - Account::lamports - Số lượng đèn tích lũy được từ hoa hồng. Đây không được tính là tiền đặt cọc.
    - authorized_voter- Chỉ có danh tính này mới được phép gửi phiếu bầu. Trường này chỉ có thể được sửa đổi bởi danh tính này.
    - node_pubkey - Nút Solana bỏ phiếu trong tài khoản này.
    - authorized_withdrawer - danh tính của pháp nhân phụ trách các báo cáo của tài khoản này, tách biệt với địa chỉ của tài khoản và người ký biểu quyết được ủy quyền.

2. VoteInstruction::Initialize(VoteInit)

    - account[0] - RW - Xếp hạng bình chọn.
    - VoteInit mang tài khoản phiếu bầu mới node_pubkey và authorized_voterauthorized_withdrawercommission các thành viên khác của VoteState được mặc định
    
3. VoteInstruction::Authorize(Pubkey, VoteAuthorize)
4. VoteInstruction::Vote(Vote)
5. StakeState
6. StakeState::Stake
7. StakeState::RewardsPool
8. StakeInstruction::DelegateStake
9. StakeInstruction::Authorize(Pubkey, StakeAuthorize)
10. StakeInstruction::Deactivate
11. StakeInstruction::Withdraw(u64)
